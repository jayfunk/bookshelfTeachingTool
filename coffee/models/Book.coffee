path = require 'path'

class Book

  title: ''
  bookFile: ''
  coverImage: ''

  constructor: (json) ->
    for key, value of json
      @[key] = value
    @_appendDirRootToFiles()

  toJSON: ->
    json = 
      title: @title
      bookFile: @bookFile
      coverImage: @coverImage
    json

  _appendDirRootToFiles: ->
    @bookFile = @directoryRoot + @bookFile
    @coverImage = @directoryRoot + @coverImage

exports.Book = Book
