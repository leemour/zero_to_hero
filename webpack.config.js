const path = require('path')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const HtmlWebPackPlugin = require('html-webpack-plugin')
const { CleanWebpackPlugin } = require('clean-webpack-plugin')

const devMode = process.env.NODE_ENV !== 'production'

module.exports = {
  entry: {
    main: path.resolve(__dirname, 'javascript', 'src', 'index.jsx'),
  },
  output: {
    path: path.resolve(__dirname, 'javascript', 'dist'),
    filename: '[name].[hash].js',
  },
  devtool: 'inline-source-map',
  resolve: {
    extensions: ['.js', '.jsx'],
    alias: {
      'react-dom': '@hot-loader/react-dom',
      components: path.resolve(__dirname, 'javascript', 'src', 'components'),
      containers: path.resolve(__dirname, 'javascript', 'src', 'containers'),
      services: path.resolve(__dirname, 'javascript', 'src', 'services'),
      actions: path.resolve(__dirname, 'javascript', 'src', 'redux', 'actions'),
      reducers: path.resolve(__dirname, 'javascript', 'src', 'redux', 'reducers'),
    },
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        use: {
          loader: 'babel-loader',
          options: {
            cacheDirectory: true,
            plugins: ['react-hot-loader/babel'],
          },
        },
        include: path.resolve(__dirname, 'javascript', 'src'),
      },
      {
        test: /\.(scss|sass|css)$/,
        use: [
          devMode ? 'style-loader' : MiniCssExtractPlugin.loader,
          'css-loader',
          'postcss-loader',
          'sass-loader',
        ],
      },
      {
        test: /\.(png|svg|jpg|gif)$/,
        use: [
          'file-loader',
        ],
      },
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/,
        use: [
          'file-loader',
        ],
      },
    ],
  },
  plugins: [
    new CleanWebpackPlugin(),
    new MiniCssExtractPlugin({
      filename: 'app.css',
    }),
    new HtmlWebPackPlugin({
      template: path.resolve(__dirname, 'javascript', 'src', 'index.html'),
    }),
  ],
  devServer: {
    historyApiFallback: true,
    hot: true,
    port: 3030,
  },
}
