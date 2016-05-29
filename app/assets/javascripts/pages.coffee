class Pages
  constructor: (@element) ->
    @voting_buttons  = @element.find(".vote")
    @errors          = @element.find(".notice")

    @voting_buttons.on "ajax:success", @successfulVote
    @voting_buttons.on "ajax:error", @errorVote

  successfulVote: (e, data, status, xhr) =>
    @count = $("#" + data.recipe)
    @vote  = $("#vote-" + data.recipe)

    if data.type == "create"
      @count.text(parseInt(@count.text()) + 1)
      @vote.attr("href", "/votes/" + data.recipe + "/toggle?voted=true")
      @vote.addClass("btn-success")
      @vote.removeClass("btn-primary")
    else
      @count.text(parseInt(@count.text()) - 1)
      @vote.attr("href", "/votes/" + data.recipe + "/toggle?voted=false")
      @vote.addClass("btn-primary")
      @vote.removeClass("btn-success")


  errorVote: =>
    @errors.html("Unfortunatly there was an error in your voting, please try again next time")

$ ->
  new Pages($("body"))
