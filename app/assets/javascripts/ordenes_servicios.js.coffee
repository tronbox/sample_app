# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
calendario = () ->
  $('.calendario').datepicker('es')


remove_fields = (link) ->
  $(link).prev("input[type=hidden]").val(1);
  $(link).parents(".fields").hide();


add_fields = (link, association, content) ->
  new_id = new Date().getTime()
  reg_exp = new RegExp("new_" + association, "g")
  item = $(content.replace(reg_exp, new_id))

  forms = $(link).parents(".lbs_formset")
  
  if(forms.size() > 1)
    wrapper = forms[0].children(".lbs_fields_wrapper")
  else 
    wrapper = forms.children(".lbs_fields_wrapper")

  children = wrapper.children(".fields")
  if(children.size() > 0)
    children.last().after(item)
  else 
   wrapper.prepend(item)
  
carga_funcionalidad = () ->
  calendario()

$(document).ready(carga_funcionalidad)

