# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
calendario = () ->
  $('.calendario').datepicker({"format": "dd-mm-yyyy", "weekStart": 1, "autoclose": true})

tabs = () ->
    $('#myTab li  a').click( ->
      $(this).tab('show')
    )

  
carga_funcionalidad = () ->
  calendario()
  tabs()

$(document).ready(carga_funcionalidad)

