$("a.vote").on
click: (event) ->
    link = $(event.target)
$.ajax
type:     "POST"
url:      "/votes"
dataType: "json"
data:
    voteType: link.attr("data-type")
userId:   link.attr("data-userId")

success: (response) ->
link.addClass("voted-#{link.attr("data-type")}")

event.preventDefault()
false
