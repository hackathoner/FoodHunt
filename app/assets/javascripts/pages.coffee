class Pages
  constructor: (@element) ->
    @document        = $(document)

    @recipe_groups   = @element.find(".recipe_group")
    @voting_buttons  = @element.find(".vote")
    @errors          = @element.find(".notice")

    @document.on "ajax:success",  @voting_buttons, @successfulVote
    @document.on "ajax:error",    @voting_buttons, @errorVote

  successfulVote: (e, data, status, xhr) =>
    @count = $("#" + data.recipe)
    @vote  = $("#vote-" + data.recipe)

    if data.type == "create"
      @createVote(data)
    else
      @destroyVote(data)

  errorVote: =>
    @errors.html("Unfortunatly there was an error in your voting, please try again next time")

  createVote: (data) =>
    @count.text(parseInt(@count.text()) + 1)

    @vote.attr("href", "/votes/" + data.recipe + "/toggle?voted=true")
    @vote.addClass("btn-success")
    @vote.removeClass("btn-primary")
    @vote.html("Unvote")

  destroyVote: (data) =>
    @count.text(parseInt(@count.text()) - 1)

    @vote.attr("href", "/votes/" + data.recipe + "/toggle?voted=false")
    @vote.addClass("btn-primary")
    @vote.removeClass("btn-success")
    @vote.html("Vote")
$ ->
  new Pages($("body"))
