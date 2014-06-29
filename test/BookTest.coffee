expect = require('chai').expect
Book = require('../Book').Book

describe 'Book', ->

  describe 'Generating the title from the raw name', ->
    beforeEach ->
      @book = new Book()
    it 'should get the title from the raw title will parse and camel case the title', ->
      result = @book._getTitle 'the_pauper_king.pdf'
      expect(result).to.equal 'The Pauper King'

    it 'should not camel case "and"', ->
      result = @book._getTitle 'me_myself_and_irene.pdf'
      expect(result).to.equal 'Me Myself and Irene'

    it 'should not camel case "of"', ->
      result = @book._getTitle 'me_myself_of_irene.pdf'
      expect(result).to.equal 'Me Myself of Irene'

    it 'should not camel case "or"', ->
      result = @book._getTitle 'me_myself_or_irene.pdf'
      expect(result).to.equal 'Me Myself or Irene'

  describe 'build the cover image location based on the pdf file name', ->
    beforeEach ->
      @book = new Book()
    it 'should strip the .pdf file type and replace it with .jpeg', ->
      result = @book._getCoverImage 'the_incredibles.pdf'
      expect(result).to.equal './bookCovers/the_incredibles.jpeg'

  describe 'build the file path for the pdf', ->
    beforeEach ->
      @book = new Book()
    it 'should make the correct path with the provided path', ->
      result = @book._getBookFilePath 'this_is_my_movie_name.pdf'
      expect(result).to.equal './books/this_is_my_movie_name.pdf'

  it 'uses a constructor to set all of the properties based on the file name', ->
    book = new Book 'the_pauper_king.pdf'
    expect(book.title).to.equal 'The Pauper King'
    expect(book.coverImage).to.equal './bookCovers/the_pauper_king.jpeg'
    expect(book.bookFile).to.equal './books/the_pauper_king.pdf'
