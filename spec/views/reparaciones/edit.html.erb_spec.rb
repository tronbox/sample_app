require 'spec_helper'

describe "reparaciones/edit" do
  before(:each) do
    @reparacion = assign(:reparacion, stub_model(Reparacion,
      :clave => "MyString",
      :descripcion => "MyString"
    ))
  end

  it "renders the edit reparacion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reparaciones_path(@reparacion), :method => "post" do
      assert_select "input#reparacion_clave", :name => "reparacion[clave]"
      assert_select "input#reparacion_descripcion", :name => "reparacion[descripcion]"
    end
  end
end
