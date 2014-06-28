class Book

  title: ''
  coverImage: ''
  bookFile: ''

  constructor: (rawTitle) ->
    @_setBookFile rawTitle
    @_setCoverImage rawTitle
    @title = @_getTitle rawTitle

  _setBookFile: (filePath) =>
    if filePath.endsWith '.pdf' 
      @bookFile = "./books/#{filePath}"

  _setCoverImage: (pdfFile) =>
    imageFile = pdfFile.replace /[.]pdf$/, '.jpeg'
    @coverImage = "./bookCovers/#{imageFile}"

  _getTitle: (rawTitle) ->
    return for word in rawTitle.split '_'
      word.replace /^./, (match) ->
        match.toUpperCase()

exports.Book = Book
