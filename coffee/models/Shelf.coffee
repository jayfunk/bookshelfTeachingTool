class Shelf

  name: ''
  books: []

  constructor: (name = '', books = []) ->
    @setName name
    @addBook books

  setName: (name) ->
    @name = name

  addBook: (book) ->
    return @books = @books.concat book if book instanceof Array
    @books.push book

exports.Shelf = Shelf
 