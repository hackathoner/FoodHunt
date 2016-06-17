class Users
  constructor: (@element) ->
    @document = $(document)

$ ->
  new Users($("body"))
