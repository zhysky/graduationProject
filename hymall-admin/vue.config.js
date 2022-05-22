/** 
* @type {import('@vue/cli-service').ProjectOptions}
*/
module.exports = {
  parallel: require('os').cpus().length > 1, // 构建时开启多进程处理babel编译
  lintOnSave: false,
  configureWebpack: {
    resolve: {
      alias: {
        'assets': '@/assets',
        'components': '@/components',
        'views': '@/views',
      }
    }
  },
  publicPath: '/admin',
  devServer: {
    // 自动打开浏览器 
    open: false,
    // 设置为0.0.0.0则所有的地址均能访问
    // host: '0.0.0.0',
    // port: 8066,
    // https: true,
    // hotOnly: false,
    proxy: {
      '/admin/api': {
        target: 'http://localhost:3001',
        changeOrigin: true,
        ws: true,
      },
    },
  },
};