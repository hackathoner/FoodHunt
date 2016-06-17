class UserValidator
  constructor: (@element) ->
    @element.validate(rules: @rules())

  rules: =>
    {
    
    }

$ ->
  new UserValidator($("body"))
