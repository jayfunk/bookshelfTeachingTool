express = require 'express'
path = require 'path'
BookService = new require('./coffee/services/BookService').BookService

StartedBookService = new BookService './books'

app = express()
app.use '/', express.static __dirname

app.get '/books', (req, res) ->
  StartedBookService.getBookData()
  #  res.send books

server = app.listen 8080, ->
  console.log 'Server started on port ' + server.address().port