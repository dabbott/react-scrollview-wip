var path = require('path');
var webpack = require('webpack');

module.exports = {
  entry: [
    "webpack-dev-server/client?http://0.0.0.0:8080",
    'webpack/hot/only-dev-server',
    './src/ScrollView'
  ],
  devtool: "eval",
  debug: true,
  output: {
    path: path.join(__dirname, "dist"),
    filename: 'react-scrollview.js'
  },
  resolveLoader: {
    modulesDirectories: ['node_modules']
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin(),
    new webpack.IgnorePlugin(/vertx/) // https://github.com/webpack/webpack/issues/353
  ],
  resolve: {
    extensions: ['', '.js', '.cjsx', '.coffee']
  },
  module: {
    loaders: [
      { test: /\.cjsx$/, loaders: ['react-hot', 'coffee', 'cjsx']},
      { test: /\.coffee$/, loader: 'coffee' }
    ]
  }
};
