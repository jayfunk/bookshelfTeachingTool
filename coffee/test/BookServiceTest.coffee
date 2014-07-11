expect = require('chai').expect
path = require 'path'
fs = require 'fs'
rmdir = require 'rimraf'
BookService = require('../services/BookService').BookService
Book = require('../models/Book').Book

describe 'Book service that will perform crud operations for books', ->
  StartedBookService = null 

  beforeEach ->
    StartedBookService = new BookService path.join __dirname, '../../books'

  it 'sets the books path when passed through the constructor', ->
    expect(StartedBookService.startingBookDir).to.equal '/Users/jfunk/projects/bookshelfTeachingTool/books'

  it 'get the paths to all of the books data files', (done) ->
    StartedBookService._getPathsToBookMetaData (error, paths) ->
      expect(paths.length).to.above 0
      expect(paths[0]).to.equal '/Users/jfunk/projects/bookshelfTeachingTool/books/a_tale_of_two_cities/bookData.json'
      done()

  it 'returns all book objects', (done) ->
    StartedBookService.getBooks (books) ->
      expect(books.length).to.above 0
      expect(books[0].title).to.equal 'A Tale of Two Cities'
      expect(books[0].bookFile).to.equal '/Users/jfunk/projects/bookshelfTeachingTool/books/a_tale_of_two_cities/A_Tale_of_Two_Cities.pdf'
      expect(books[0].coverImage).to.equal '/Users/jfunk/projects/bookshelfTeachingTool/books/a_tale_of_two_cities/A_Tale_of_Two_Cities.jpeg'
      done()

  it 'coverts all of the json objects into actual models', (done) ->
    StartedBookService.getBooks (books) ->
      book = books[0]
      expect(book).to.be.an.instanceof(Book)
      done()

  describe 'create new books', ->
    bookDir = path.join __dirname, '../../books/a time to kill'
    aTimeToKill = new Book 
      title: 'A Time To Kill'
      bookFile: 'a_time_to_kill.pdf'
      coverImage: 'a_time_to_kill.jpeg'

    beforeEach ->
      rmdir bookDir, (error) ->
        if error
          console.log 'Error During Clean up: ' + error

    it 'creates a directory', ->
      StartedBookService.addBook aTimeToKill
      result = fs.existsSync bookDir
      expect(result).to.be.true

    it 'creates the bookData.json file', ->
      StartedBookService.addBook aTimeToKill
      result = fs.existsSync path.join bookDir, 'bookData.json'
      expect(result).to.be.true

    it 'puts all of the data in the bookData.json', ->
      StartedBookService.addBook aTimeToKill
      json = JSON.parse fs.readFileSync path.join(bookDir, 'bookData.json'), 'utf8'
      expect(json.title).to.equal aTimeToKill.title
      expect(json.bookFile).to.equal aTimeToKill.bookFile
      expect(json.coverImage).to.equal aTimeToKill.coverImage

    it 'writes the book file'

    it 'writes the cover image'

