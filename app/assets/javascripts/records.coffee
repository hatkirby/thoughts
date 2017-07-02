# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  $(".should-create-record-field input[type=checkbox]").change ->
    if $(".should-create-record-field input[type=checkbox]").prop("checked")
      $(".record-description-field").show()
    else
      $(".record-description-field").hide()
