$(document).on "page:fetch", ->
  $("#contents").addClass "fadeout"
$(document).on "page:restore", ->
  $("#contents").removeClass "fadeout"
$(document).on "page:load ready", ->
  $("#contents").removeClass "before-fadein"
