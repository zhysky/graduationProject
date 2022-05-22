module.exports = {
  root: true,
  env: {
    node: true
  },
  'extends': [
    'plugin:vue/essential',
    'eslint:recommended'
  ],
  parserOptions: {
    parser: "babel-eslint",
    ecmaVersion: 2020,
    sourceType: "module",
  },
  rules: {
    "babel/new-cap": 0,
    "babel/camelcase": 0,
    "babel/no-invalid-this": 0,
    "babel/object-curly-spacing": 0,
    "babel/no-unused-expressions": 0,
    "babel/valid-typeof": 0,
    // 'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    // 'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off'
  }
}
