const path = require( 'path' );
const glob = require('glob')

module.exports = {
  context: __dirname,
  entry: {
    js: glob.sync('./src/**/*.js')
  },
  resolve: {
    modules: ['node_modules'],
    extensions: ['.js', '.elm']
  },
  output: {
    filename: 'main.js',
    path: path.resolve( __dirname, 'dist' ),
  },
  module: {
    noParse: /\.elm$/,
    rules: [{
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      use: {
        loader: 'elm-webpack-loader',
        options: {}
      }
    }]
  }
}