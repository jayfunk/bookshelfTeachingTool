class Book

  title: ''
  coverImage: ''
  bookFile: ''

  constructor: (rawTitle = '') ->
    @setBookFilePath rawTitle
    @setCoverImage rawTitle
    @setTitle rawTitle

  setBookFilePath: (fileName) ->
    @bookFile = "./books/#{fileName}"

  setCoverImage: (coverImage) ->
    @coverImage = "./bookCovers/#{@_getCoverImageFromPDFFileName(coverImage)}"

  setTitle: (title) ->
    @title = @_getTitleFromPDFFileName title

  _getCoverImageFromPDFFileName: (pdfFile) =>
    pdfFile.replace /[.]pdf$/, '.jpeg'

  _getTitleFromPDFFileName: (rawTitle) ->
    baseTitle = rawTitle.replace '.pdf', ''
    titleWords = for word in baseTitle.split '_'
      unless word is 'and' or word is 'or' or word is 'of'
        word.replace /^./, (match) -> match.toUpperCase()
      else
        word
    titleWords.join ' '

exports.Book = Book
