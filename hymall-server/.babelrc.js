/**
 * @type {import('@babel/core').TransformOptions}
 */
module.exports = {
  presets: [
    "@babel/preset-env"
  ],
  plugins: [
    ["@babel/plugin-proposal-decorators", { legacy: true }],
    ["@babel/plugin-proposal-class-properties", { loose: true }],
    ["@babel/plugin-transform-runtime", { regenerator: true }],
    ["@babel/plugin-proposal-pipeline-operator", { "proposal": "minimal" }],
    ["@babel/plugin-proposal-optional-chaining"]
  ]
}