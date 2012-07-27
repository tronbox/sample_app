require 'spec_helper'

describe "estados/edit" do
  before(:each) do
    @estado = assign(:estado, stub_model(Estado,
      :clave => "MyString",
      :descripcion => "MyString",
      :color_estado => "MyString"
    ))
  end

  it "renders the edit estado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => estados_path(@estado), :method => "post" do
      assert_select "input#estado_clave", :name => "estado[clave]"
      assert_select "input#estado_descripcion", :name => "estado[descripcion]"
      assert_select "input#estado_color_estado", :name => "estado[color_estado]"
    end
  end
end
