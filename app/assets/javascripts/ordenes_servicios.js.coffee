# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
calendario = () ->
  $('.calendario').datepicker({"format": "dd-mm-yyyy", "weekStart": 1, "autoclose": true})
  $('.timepicker-default').timepicker()


tabs = () ->
    $('#myTab li  a').click( ->
      $(this).tab('show')
    )
open_modal = () ->
  $('.open_modal_refaccion').click( ->
    id = $(this).parent().siblings().last().attr('id')
    $('#myModalRefacciones').attr('data', id)
    $('#myModalRefacciones').show({
      backdrop: true
    })
    $('#myModalRefacciones').show({
      backdrop: true
    })
  )
close_modal = () ->
  $('.modal-refacciones-close').click(->
    $('#myModalRefacciones').attr('data', '')
    $('#myModalRefacciones').hide()
  )
  
carga_funcionalidad = () ->
  calendario()
  tabs()
  open_modal()
  close_modal()

$(document).ready(carga_funcionalidad)

jQuery ->
  $('.datatable').dataTable
    "oLanguage": lanES,
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap"
