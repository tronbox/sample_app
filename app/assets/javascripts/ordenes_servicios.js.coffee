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

@selecciona_activo = () -> 
  $(".selecciona_activo").click( ->   
    nombre = $(this).parent().parent().parent().find("td.descripcion_activo").text()
    id = $(this).parent().parent().parent().find("td.id_activo").text()
    asigna_activo(nombre, id)
    $('#myModal').modal('hide')
    false 
  )

#Ojo este mejor llevarlo utilsc.js.coffee
@asigna_activo = (nombre, id) ->
  $("#nombre_activo").attr('value', nombre)
  $("#orden_servicio_activo_id").attr('value', id)
  false

  
carga_funcionalidad = () ->
  calendario()
  tabs()
  selecciona_activo()

$(document).ready(carga_funcionalidad)

