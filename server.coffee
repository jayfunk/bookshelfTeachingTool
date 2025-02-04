express = require 'express'
path = require 'path'
BookService = new require('./coffee/services/BookService').BookService

StartedBookService = new BookService './books'

app = express()
app.use '/', express.static __dirname

app.get '/books', (req, res) ->
  StartedBookService.getBooks (books) ->
    res.send books

app.get '/books/new', (req, res) ->

server = app.listen 8080, ->
  console.log 'Server started on port ' + server.address().port