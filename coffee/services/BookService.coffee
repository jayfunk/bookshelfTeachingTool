path = require 'path'
glob = require 'glob'
fs = require 'fs'
Book = require('../models/Book').Book

class BookService

  startingBookDir: './'
  _bookDataFileName: 'bookData.json'

  constructor: (startingBookDir) ->
    if startingBookDir? then @startingBookDir = startingBookDir

  getBooks: (callback) ->
    @_getPathsToBookMetaData (error, files) =>
      books = for file in files
        json = JSON.parse fs.readFileSync file, 'utf8'
        json.directoryRoot = file.replace "#{@_bookDataFileName}", ''
        book = new Book json
        book
      callback books

  addBook: (book, bookFile, coverImage) ->
    bookDir = path.join @startingBookDir, book.title.toLowerCase()
    unless fs.existsSync bookDir
      fs.mkdirSync bookDir
    fs.writeFileSync path.join(bookDir, 'bookData.json'), JSON.stringify(book.toJSON())

  _getPathsToBookMetaData: (callback) ->
    glob "#{@startingBookDir}/**/#{@_bookDataFileName}", (error, files) ->
      callback error, files

exports.BookService = BookService