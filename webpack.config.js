const path = require( 'path' );
const glob = require('glob')

module.exports = {
    context: __dirname,
    entry: {
      js: glob.sync('./src/**/*.js')
    },
    output: {
      filename: 'main.js',
      path: path.resolve( __dirname, 'dist' ),
    },
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /node_modules/,
          use: 'babel-loader',
        }
      ]
    }
};