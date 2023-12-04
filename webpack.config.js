const path = require("path");

module.exports = {
  entry: "./src/index.ts",
  mode: "production",
  module: {
    rules: [
      {
        test: /\.tsx?$/,
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
  },
};