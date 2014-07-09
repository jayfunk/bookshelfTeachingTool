expect = require('chai').expect
Shelf = require('../Shelf').Shelf
Book = require('../Book').Book

describe 'Shelf contains multiple books and can have a name for the shelf', ->

  shelf = new Shelf()

  beforeEach ->
    shelf.books = []
    
  it 'can have a name', ->
    shelf.setName 'My Books'
    expect(shelf.name).to.equal 'My Books'

  it 'can have multiple books added to it', ->
    shelf.addBook new Book 'the_pauper_king.pdf'
    shelf.addBook new Book 'the_pauper_king_part2_return_of_the_pauper.pdf'
    expect(shelf.books.length).to.equal 2

  it 'can have multiple books added at once', ->
    books = [new Book('ted.pdf'), new Book('et.pdf')]
    shelf.addBook books
    expect(shelf.books.length).to.equal 2

  it 'can be created with the constructor', ->
    testShelf = new Shelf 'This Shelf', [new Book('Game_of_Thrones.pdf'), new Book('Atlas_Shrugged')]
    expect(testShelf.name).to.equal 'This Shelf'
    expect(testShelf.books.length).to.equal 2