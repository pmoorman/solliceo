# Chardin.Js

$ ->
  $("body").chardinJs()
  $("a[data-toggle=\"chardinjs\"]").on "click", (e) ->
    e.preventDefault()
    ($("body").data("chardinJs")).toggle()