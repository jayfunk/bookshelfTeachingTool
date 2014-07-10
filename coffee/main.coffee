window.exports = {}

request = null

window.loadBooks = ->
  request = new XMLHttpRequest()
  request.onreadystatechange = processJSONResponse
  request.open 'GET', '/books', true
  request.send()

window.processJSONResponse = ->
  if request.readyState is 4 and request.status is 200
    jsonResponse = JSON.parse request.responseText
    renderBooks jsonResponse

window.renderBooks = (books) ->
  bookHTML = ''
  for book in books
    bookHTML += """
    <div>
      <a href='#{book.bookFilePath}'>
        <img src='#{book.coverImagePath}'/>
        <h5>#{book.title}</h5>
      </a>
    </div>
    """
  document.body.innerHTML = bookHTML 