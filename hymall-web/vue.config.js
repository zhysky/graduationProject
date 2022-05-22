/**
* @type {import('@vue/cli-service').ProjectOptions}
*/
module.exports = {
  'transpileDependencies': [
    'vuetify'
  ],
  lintOnSave: false,
  parallel: require('os').cpus().length > 1,
  // publicPath: '/web',
  configureWebpack: {
    resolve: {
      alias: {
        'assets': '@/assets',
        'components': '@/components',
        'views': '@/views',
      }
    }
  },
};