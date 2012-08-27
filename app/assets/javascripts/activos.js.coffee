# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

selecciona_activo = (element) ->
  $(element).find(".selecciona_activo").click( ->   
    nombre = $(this).parent().parent().find("td.descripcion_activo").text()
    id = $(this).parent().parent().find("td.id_activo").text()
    asigna_activo(nombre, id)
    $('#myModal').modal('hide')
    false 
  )

@asigna_activo = (nombre, id) ->
  $("#nombre_activo").attr('value', nombre)
  $("#orden_servicio_activo_id").attr('value', id)
  false


jQuery ->
  $('#activos').dataTable
    oLanguage: lanES
    sDom: "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
    sPaginationType: "bootstrap"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#activos').data('source')

  $('#activos_modal').dataTable
    oLanguage: lanES,
    sDom: "<'row'<'span4'l><'span4'f>r>t<'row'<'span4'i><'span4'p>>",
    sPaginationType: "bootstrap",
    aLengthMenu: [[10, -1], [5, "All"]],
    iDisplayLength: 5
    bProcessing: true
    bServerSide: true
    fnServerParams: ( aoData ) ->
      aoData.push( { "name": "origen", "value": "orden_servicio" } )
    sAjaxSource: $('#activos_modal').data('source')
    fnRowCallback: ( nRow, aData, iDisplayIndex, iDisplayIndexFull ) ->
      $('td:eq(0)', nRow).addClass('id_activo')
      $('td:eq(2)', nRow).addClass('descripcion_activo')
      selecciona_activo(nRow)

