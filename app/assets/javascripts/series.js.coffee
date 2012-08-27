# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#series').dataTable
    oLanguage: lanES
    sDom: "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
    sPaginationType: "bootstrap"
    bProcessing: true
    bServerSide: true
    fnServerParams: ( aoData ) ->
      aoData.push( { "name": "origen", "value": "orden_servicio" } )
    sAjaxSource: $('#series').data('source')
