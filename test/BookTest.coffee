expect = require('chai').expect
Book = require('../Book').Book

describe 'Book', ->

  book = null 

  beforeEach ->
    book = new Book()

  describe 'Generating the title from the raw name', ->

    it 'should get the title from the raw title will parse and camel case the title', ->
      result = book._getTitleFromPDFFileName 'the_pauper_king.pdf'
      expect(result).to.equal 'The Pauper King'

    it 'should not camel case "and"', ->
      result = book._getTitleFromPDFFileName 'me_myself_and_irene.pdf'
      expect(result).to.equal 'Me Myself and Irene'

    it 'should not camel case "of"', ->
      result = book._getTitleFromPDFFileName 'me_myself_of_irene.pdf'
      expect(result).to.equal 'Me Myself of Irene'

    it 'should not camel case "or"', ->
      result = book._getTitleFromPDFFileName 'me_myself_or_irene.pdf'
      expect(result).to.equal 'Me Myself or Irene'

  describe 'build the cover image location based on the pdf file name', ->

    it 'should strip the .pdf file type and replace it with .jpeg', ->
      result = book._getCoverImageFromPDFFileName 'the_incredibles.pdf'
      expect(result).to.equal 'the_incredibles.jpeg'

    it 'should set the correct path to the cover images when using the set funciton', ->
      book.setCoverImage 'the_incredibles.jpeg'
      expect(book.coverImage).to.equal './bookCovers/the_incredibles.jpeg'

  describe 'build the file path for the pdf', ->

    it 'should make the correct path with the provided path', ->
      book.setBookFilePath 'this_is_my_movie_name.pdf'
      expect(book.bookFile).to.equal './books/this_is_my_movie_name.pdf'

  it 'uses a constructor to set all of the properties based on the file name', ->
    book = new Book 'the_pauper_king.pdf'
    expect(book.title).to.equal 'The Pauper King'
    expect(book.coverImage).to.equal './bookCovers/the_pauper_king.jpeg'
    expect(book.bookFile).to.equal './books/the_pauper_king.pdf'
