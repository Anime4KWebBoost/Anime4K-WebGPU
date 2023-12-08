const path = require("path");
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

module.exports = {
  entry: "./src/index.ts",
  mode: "production",
  module: {
    rules: [
      {
        test: /\.ts?$/,
        use: "ts-loader",
        exclude: /node_modules/,
      },
      {
        test: /\.wgsl$/,
        use: "raw-loader",
      }
    ],
  },
  resolve: {
    extensions: [".ts", ".wgsl"],
  },
  output: {
    filename: "index.js",
    path: path.resolve(__dirname, "lib"),
    library: "anime4k-webgpu",
    libraryTarget: "umd",
    globalObject: "this",
  },
  plugins: [ new CleanWebpackPlugin() ]
};
