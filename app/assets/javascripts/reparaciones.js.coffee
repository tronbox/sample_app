# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

selecciona_reparacion = (element) ->
  $(element).find(".selecciona_reparacion").click( ->   
    descripcion = $(this).parent().parent().find("td.descripcion_reparacion").text()
    id = $(this).parent().parent().find("td.id_reparacion").text()
    pasos = $(this).parent().parent().find("td.pasos").text()
    asigna_reparacion(descripcion, id, pasos)
    $('#myModal_reparaciones').modal('hide')
    false 
  )

asigna_reparacion = (descripcion, id, pasos) ->
  $("#descripcion_reparacion").attr('value', descripcion)
  $("#orden_servicio_reparacion_id").attr('value', id)
  $("#pasos").attr('value', pasos)
  false


jQuery ->
  $('#reparaciones').dataTable
    oLanguage: lanES
    sDom: "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
    sPaginationType: "bootstrap"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#reparaciones').data('source')

  $('#reparaciones_modal').dataTable
    oLanguage: lanES,
    sDom: "<'row'<'span4'l><'span4'f>r>t<'row'<'span4'i><'span4'p>>",
    sPaginationType: "bootstrap",
    aLengthMenu: [[10, -1], [5, "All"]],
    iDisplayLength: 5
    bProcessing: true
    bServerSide: true
    fnServerParams: ( aoData ) ->
      aoData.push( { "name": "origen", "value": "orden_servicio" } )
    sAjaxSource: $('#reparaciones_modal').data('source')
    fnRowCallback: ( nRow, aData, iDisplayIndex, iDisplayIndexFull ) ->
      $('td:eq(0)', nRow).addClass('id_reparacion')
      $('td:eq(2)', nRow).addClass('descripcion_reparacion')
      $('td:eq(3)', nRow).addClass('pasos')
      selecciona_reparacion(nRow)

