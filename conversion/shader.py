import re
import os
from typing import List
import sys

class Texture:
  def __init__(self, name: str, ratio: List[int]) -> None:
    self.ratio = ratio
    self.name = name

class TextureSet:
  def __init__(self) -> None:
    self.textures = dict()
  def getTexture(self, name: str) -> Texture:
    if name not in self.textures:
      self.textures[name] = Texture(name, [1, 1])
    return self.textures[name]

class Context:
  def __init__(self, glslPath: str, outputRoot: str) -> None:
    self.glslPath = glslPath
    self.glslName = glslPath.split("/")[-1].split(".")[0]
    self.category = glslPath.split("/")[-2]
    self.outputRoot = outputRoot
    self.textureSet = TextureSet()
    self.layers: list[Layer] = []
    print(f"loading GLSL \"{self.glslName}\" of category \"{self.category}\"\n")

  def determineLayerType(self, line: str) -> str:
    if "//!DESC" not in line:
      return None
    if "-Conv-" in line:
      return "conv2d"
    elif "Depth-to-Space" in line:
      return "depth2space"
    raise ValueError(line)

  def parseGLSL(self) -> None:
    glslTotal = None
    with open(self.glslPath, "r") as f:
      glslTotal = f.readlines()
    curLayer: Layer = None
    while len(glslTotal) > 0:
      line = glslTotal.pop(0)
      layerType = self.determineLayerType(line)
      if layerType is None:
        # not desc
        if curLayer is None:
          # line outside texture definition
          continue
        else:
          # line within layer
          curLayer.parseGLSLLine(line)
      else:
        # a desc with a valid layer
        if layerType == "conv2d":
          curLayer = Conv2DLayer(self)
          curLayer.parseGLSLLine(line)
        elif layerType == "depth2space":
          curLayer = Depth2SpaceLayer(self)
          curLayer.parseGLSLLine(line)
        else:
          raise ValueError(layerType)
      if curLayer.isComplete():
        self.layers.append(curLayer)
        curLayer = None
  
  def writeShaders(self):
    for layer in self.layers:
      filename = layer.save.name.replace("_", "")
      folderPath = os.path.join(self.outputRoot, "shaders", self.category, self.glslName)
      os.makedirs(folderPath, exist_ok=True)
      filePath = os.path.join(folderPath, f"{filename}.wgsl")
      shaderContent = layer.genShader()
      if shaderContent is None:
        continue
      with open(filePath, "w") as f:
        f.write(layer.genShader())
      print(f"GenShader: {layer.desc} -> {filePath}")

  def writePipelineSummary(self) -> None:
    for i, layer in enumerate(self.layers):
      print(f"Layer {i}: {layer.desc}\n{layer.genShader()}")

class Layer:
  def __init__(self, context: Context) -> None:
    self.desc = "UNKNOWN LAYER"
    self.hook = "UNKNOWN STAGE"
    self.binds: list[Texture] = [] # inputs
    self.save: Texture = None  # output
    self.context: Context = context
    self.wgslBindText = "" # binding lines
    self.wgslHelperText = "" # helper functions
    self.wgslComputeText = ""

    # states for parsing
    self.bindCount = 0
    self.max4Needed = False
    self.section = "directives"

  def isComplete(self) -> bool:
    return self.section == "end"

  def parseGLSLLine(self, line: str) -> None:
    pass

  def parseGLSLDirectiveLine(self, line: str) -> None:
    # MPV directives
    [key, value] = line.split(" ", 1)
    value = value.strip()
    key = key[3:]
    if key == "DESC":
      self.desc = value
    elif key == "HOOK":
      self.hook = value
    elif key == "BIND":
      self.binds.append(self.context.textureSet.getTexture(value))
      self.wgslBindText += f"@group(0) @binding({self.bindCount}) var {value}_tex: texture_2d<f32>;\n"
      self.bindCount += 1
    elif key == "SAVE":
      value = "output" if value == "MAIN" else value
      self.save = self.context.textureSet.getTexture(value)
      self.wgslBindText += f"@group(0) @binding({self.bindCount}) var {value}_tex: texture_storage_2d<rgba16float, write>;\n"
      self.bindCount += 1
    elif key == "WIDTH":
      parts = value.split()
      baseTextureName = parts[0].split(".")[0]
      baseTexture = self.context.textureSet.getTexture(baseTextureName)
      baseTextureRatio = baseTexture.ratio
      if len(parts) >= 3:
        op = parts[2]
        assert op == "*"
        ratio = eval(parts[1])
        self.save.ratio[0] = baseTextureRatio[0] * ratio
      else:
        self.save.ratio[0] = baseTextureRatio[0]
    elif key == "HEIGHT":
      parts = value.split()
      baseTextureName = parts[0].split(".")[0]
      baseTexture = self.context.textureSet.getTexture(baseTextureName)
      baseTextureRatio = baseTexture.ratio
      if len(parts) >= 3:
        op = parts[2]
        assert op == "*"
        ratio = eval(parts[1])
        self.save.ratio[1] = baseTextureRatio[1] * ratio
      else:
        self.save.ratio[1] = baseTextureRatio[1]

  def genShader(self) -> str:
    raise ValueError("Not implemented")


class Conv2DLayer(Layer):
  def __init__(self, context: Context) -> None:
    super().__init__(context)
  def parseGLSLLine(self, line: str) -> None:
    if line.startswith("//!"):
      self.parseGLSLDirectiveLine(line)
    elif line.startswith("#define"):
      if self.section == "directives":
        self.section = "definitions"
      assert self.section == "definitions"
      if "go_" in line:
        lineParts = re.split(r'\(|\)', line.split(" ", 1)[1])
        signature = lineParts[0]

        # offset helpers
        if "max(" not in line:
          # special offset
          textureName = lineParts[3].rsplit("_", 1)[0]
          self.wgslHelperText += f"""
fn {signature}(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {{
  return textureLoad({textureName}_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0);
}}"""
        else:
          self.max4Needed = True
          # part of crelu
          lineParts = re.split(r'\(|\)', line.split(" ", 1)[1])
          textureName = lineParts[5].rsplit("_", 1)[0]
          negative = lineParts[4]
          self.wgslHelperText += f"""
fn {signature}(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {{
  return max4({negative}textureLoad({textureName}_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}}\n"""
      elif "g_" in line:
        # non-offset helpers
        assert "max(" in line
        self.max4Needed = True
        [_, signature, impl] = line.split(" ", 2)
        parts = re.split(r'\(|\)', impl)
        textureName = parts[3].rsplit("_", 1)[0]
        negative = parts[2]
        self.wgslHelperText += f"""
fn {signature}(pos: vec2u) -> vec4f {{
  return max4({negative}textureLoad({textureName}_tex, pos, 0), 0.0);
}}\n"""
        pass
      else:
        print(f"Unrecognized define directive: {line}")
    elif line.startswith("vec4 hook() {"):
      if self.section == "definitions":
        self.section = "computeMain"
      assert self.section == "computeMain"
      assert self.save is not None
      self.wgslComputeText = f"""@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {{
  // OOB check
  let dim_out: vec2u = textureDimensions({self.save.name}_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {{
    return;
  }}
  
  var result: vec4f = vec4f(0.0);"""
    elif line.startswith("}"):
      if self.section == "computeMain":
        self.section = "end"
      assert self.section == "end"
      self.wgslComputeText += "\n}"
    else:
      if self.section == "computeMain":
        # content of hook / ComputeMain
        if "mat4" in line:
          if "go_" in line:
            parts = re.split(r'\(|\)', line)
            offsets = [int(eval(i)) for i in re.split(r'\s|,', parts[-2]) if len(i) > 0] 
            gSignature = parts[-3].split()[-1]
            weights = parts[-4]
            self.wgslComputeText += f"""
  result += mat4x4<f32>({weights}) * {gSignature}(pixel.xy, {offsets[0]}, {offsets[1]});"""
          elif "g_" in line:
            parts = re.split(r'\(|\)', line)
            gSignature = parts[-1].split()[-1].strip(';')
            weights = parts[-2]
            self.wgslComputeText += f"""
  result += mat4x4<f32>({weights}) * {gSignature}(pixel.xy);"""
        elif "vec4" in line:
          parts = re.split(r'\(|\)', line)
          bias = parts[-2]
          self.wgslComputeText += f"""
  result += vec4f({bias});"""
        elif "return" in line:
          self.wgslComputeText += f"""
  textureStore({self.save.name}_tex, pixel.xy, result);"""
      else:
        print("unrecognized line while not in computeMain: " + line)
        raise ValueError(line)

  def genShader(self) -> str:
    if self.max4Needed:
      helperFull = """fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}\n""" + self.wgslHelperText
    else:
      helperFull = self.wgslHelperText
    return f"""// Layer: {self.desc}
// Name: {self.save.name.replace("_", "")}
// Inputs: {[b.name for b in self.binds]}
// Output: {self.save.name}
{self.wgslBindText}{helperFull}

{self.wgslComputeText}
"""

class Depth2SpaceLayer(Layer):
  def __init__(self, context: Context) -> None:
    super().__init__(context)
  
  def parseGLSLLine(self, line: str) -> None:
    if line.startswith("//!"):
      self.parseGLSLDirectiveLine(line)
    elif line.strip().startswith("}"):
      self.section = "end"

  def genShader(self) -> str:
    return f"""// DELETE ME: Use depthToSpace & Possibly Overlay instead
// Layer: {self.desc}
// Name: {self.save.name.replace("_", "")}
// Inputs: {[b.name for b in self.binds]}
// Output: {self.save.name}"""

if __name__ == "__main__":
  if (len(sys.argv) == 3):
    context = Context(sys.argv[1], sys.argv[2])
    context.parseGLSL()
    context.writeShaders()
    exit(0)
  elif (len(sys.argv) == 4 and sys.argv[3] == "-t"):
    context = Context(sys.argv[1], sys.argv[2])
    context.parseGLSL()
    context.writePipelineSummary()
    exit(0)
  print("Usage: python3 shader.py <glsl_full_path> <output_root>")
  print("shaders folder will be created under <output_root> if not exist")
  exit(1)
