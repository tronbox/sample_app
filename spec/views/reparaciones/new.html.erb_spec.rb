require 'spec_helper'

describe "reparaciones/new" do
  before(:each) do
    assign(:reparacion, stub_model(Reparacion,
      :clave => "MyString",
      :descripcion => "MyString"
    ).as_new_record)
  end

  it "renders new reparacion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reparaciones_path, :method => "post" do
      assert_select "input#reparacion_clave", :name => "reparacion[clave]"
      assert_select "input#reparacion_descripcion", :name => "reparacion[descripcion]"
    end
  end
end
