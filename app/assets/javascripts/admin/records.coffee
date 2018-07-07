# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

create_record_toggle = (checked) ->
  if checked
    $(".record-description-field").show()
  else
    $(".record-description-field").hide()

published_field_toggle = (checked) ->
  if checked
    $(".should-create-record-field input[type=checkbox]").prop("disabled", false)
  else
    $(".should-create-record-field input[type=checkbox]").prop("disabled", true)
    $(".should-create-record-field input[type=checkbox]").prop("checked", false)
    create_record_toggle(false)

$(document).on "turbolinks:load", ->
  if $(".published-field").length > 0
    published_field_toggle($(".published-field input[type=checkbox]").prop("checked"))
  $(".should-create-record-field input[type=checkbox]").change ->
    create_record_toggle($(this).prop("checked"))
  $(".published-field input[type=checkbox]").change ->
    published_field_toggle($(this).prop("checked"))
  $("input[type=tags]").each ->
    tagsInput(this)
