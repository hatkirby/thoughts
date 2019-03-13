# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
dash_ready = ->
  $(".datepicker").datepicker({"dateFormat": "yy-mm-dd"})

$(document).ready(dash_ready)
$(document).on('turbolinks:load', dash_ready)
