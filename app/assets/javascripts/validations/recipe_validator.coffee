class RecipeValidator
  constructor: (@element) ->
    @element.validate(rules: @rules())

  rules: =>
    {
      "recipe[title]":
        required: true
        maxlength: 255

      "recipe[tagline]":
        required: true
        maxlength: 255

      "recipe[link]":
        required: true
        url: true

      "recipe[image]":
        url: true
    }

$ ->
  new RecipeValidator($("form#new_recipe"))
