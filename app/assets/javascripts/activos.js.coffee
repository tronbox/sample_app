# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
jQuery ->
  $('.datatable').dataTable
    "oLanguage": lanES,
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap"

  $('.datatable_modal').dataTable
    "oLanguage": lanES,
    "sDom": "<'row'<'span4'l><'span4'f>r>t<'row'<'span4'i><'span4'p>>",
    "sPaginationType": "bootstrap",
    "aLengthMenu": [[10, -1], [5, "All"]],
    "iDisplayLength": 5

