class Book

  title: ''
  coverImage: ''
  bookFile: ''

  constructor: (rawTitle = '') ->
    @bookFile = @_getBookFilePath rawTitle
    @coverImage = @_getCoverImage rawTitle
    @title = @_getTitle rawTitle

  _getBookFilePath: (filePath) =>
    "./books/#{filePath}"

  _getCoverImage: (pdfFile) =>
    imageFile = pdfFile.replace /[.]pdf$/, '.jpeg'
    "./bookCovers/#{imageFile}"

  _getTitle: (rawTitle) ->
    baseTitle = rawTitle.replace '.pdf', ''
    titleWords = for word in baseTitle.split '_'
      unless word is 'and' or word is 'or' or word is 'of'
        word.replace /^./, (match) -> match.toUpperCase()
      else
        word
    titleWords.join ' '

exports.Book = Book
