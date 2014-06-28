express = require 'express'
fs = require 'fs'
Book = require('./Book').Book

console.log new Book 'test'


server = express()

server.get '/books', (req, res) ->
  books = getBooks()
  res.send books

getBooks = ->
  fs.readdir './books', (err, files) ->
    books = []
    books.push new Book file for file in files 
    books

server.listen 8080