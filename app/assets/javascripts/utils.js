function disabled_element(elemento){
  $(elemento).attr('disabled', true);
}

function enabled_element(elemento_enabled){
  $(elemento_enabled).removeAttr('disabled');
}

function remove_fields(link){
  $(link).prev("input[type=hidden]").val(1);
  $(link).parents(".fields").hide();
}

function add_fields(link, association, content){
  var new_id = new Date().getTime();
  var reg_exp = new RegExp("new_" + association, "g");
  var item = $(content.replace(reg_exp, new_id));

  var forms = $(link).parents(".lbs_formset");
  var wrapper = forms.size() > 1 ? forms[0].children(".lbs_fields_wrapper") : forms.children(".lbs_fields_wrapper");
  var children = wrapper.children(".fields");
  if(children.size() > 0){
    children.last().after(item);
  } else {
    wrapper.prepend(item);
  }
  $('.calendario').datepicker({"format": "dd-mm-yyyy", "weekStart": 1, "autoclose": true})
  $('.timepicker-default').timepicker()
  $('.open_modal_refaccion').click(function(){
    id = $(this).parent().siblings().last().attr('id')
    $('#myModalRefacciones').attr('data', id)
    $('#myModalRefacciones').show({
      backdrop: true
    })
  })

}

