class Book

  title: ''
  bookFilePath: ''
  coverImagePath: ''

  constructor: (rawTitle = '', bookFilePath = '', coverImagePath = '') ->
    if bookFilePath is '' and coverImagePath is ''
      @setBookFilePath rawTitle
      @setCoverImage rawTitle
      @setTitle rawTitle
    else
      @title = rawTitle
      @bookFilePath = bookFilePath
      @coverImagePath = coverImagePath

  setBookFilePath: (fileName) ->
    @bookFilePath = "./books/#{fileName}"

  setCoverImage: (coverImage) ->
    @coverImagePath = "./bookCovers/#{@_getCoverImageFromPDFFileName(coverImage)}"

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
