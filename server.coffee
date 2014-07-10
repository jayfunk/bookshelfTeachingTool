express = require 'express'
fs = require 'fs'
Book = require('./coffee/models/Book').Book

app = express()

app.use '/', express.static __dirname

app.get '/books', (req, res) ->
  fs.readdir './books', (err, files) ->
    books = for file in files
      continue if file is '.DS_Store'
      new Book file
    res.send books

server = app.listen 8080, ->
  console.log 'Server started on port ' + server.address().port