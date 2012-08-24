module FormsHelper
  def self.included(base)
    ActionView::Base.default_form_builder = CustomFormBuilder
  end
 
  class CustomFormBuilder < ActionView::Helpers::FormBuilder
    def label(method, text = nil, options = {}, &block)
      str = @template.label(@object_name, method, text, objectify_options(options), &block)
      mark = "* " if @object.class.validators_on(method).map(&:class).include? ActiveModel::Validations::PresenceValidator
      mark ||= ""
      (mark + str).html_safe
    end
  end  
  
end
