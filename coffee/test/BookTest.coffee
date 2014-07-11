expect = require('chai').expect
Book = require('../models/Book').Book

describe 'Book model that contains the meta data', ->

  book = null 
  bookJSON = 
    title: 'The Pauper King'
    bookFile: 'the_pauper_king.pdf'
    coverImage: 'the_pauper_king.jpeg'
    directoryRoot: '/books/thepauperking/'

  beforeEach ->
    book = new Book()

  it 'can take a plain js object and use it to populate its properties', ->
    book = new Book bookJSON
    expect(book.title).to.equal bookJSON.title
    expect(book.bookFile).to.equal bookJSON.directoryRoot + bookJSON.bookFile
    expect(book.coverImage).to.equal bookJSON.directoryRoot + bookJSON.coverImage

  it 'can export its properties to json with a single method', ->
    book = new Book bookJSON
    jsonOfBook = book.toJSON()
    expect(jsonOfBook).to.not.be.an.instanceof Book
    expect(jsonOfBook.title).to.equal book.title

  it 'takes the root directory property and appends it to the files on construction', ->
