expect = require('chai').expect
path = require 'path'
BookService = require('../services/BookService').BookService
Book = require('../models/Book').Book

describe 'Book service that will retrieve information about books', ->
  StartedBookService = null 

  beforeEach ->
    StartedBookService = new BookService path.join __dirname, '../../books'

  it 'sets the books path when passed through the constructor', ->
    expect(StartedBookService.startingBookDir).to.equal '/Users/jfunk/projects/bookshelfTeachingTool/books'

  it 'get the paths to all of the books data files', (done) ->
    StartedBookService._getPathsToBookMetaData (error, paths) ->
      expect(paths.length).to.equal 1
      expect(paths[0]).to.equal '/Users/jfunk/projects/bookshelfTeachingTool/books/a_tale_of_two_cities/bookData.json'
      done()

  it 'returns all book objects', (done) ->
    StartedBookService.getBooks (books) ->
      expect(books.length).to.equal 1
      expect(books[0].title).to.equal 'A Tale of Two Cities'
      expect(books[0].bookFile).to.equal '/Users/jfunk/projects/bookshelfTeachingTool/books/a_tale_of_two_cities/A_Tale_of_Two_Cities.pdf'
      expect(books[0].coverImage).to.equal '/Users/jfunk/projects/bookshelfTeachingTool/books/a_tale_of_two_cities/A_Tale_of_Two_Cities.jpeg'
      done()

  it 'coverts all of the json objects into actual models', (done) ->
    StartedBookService.getBooks (books) ->
      book = books[0]
      expect(book).to.be.an.instanceof(Book)
      done()