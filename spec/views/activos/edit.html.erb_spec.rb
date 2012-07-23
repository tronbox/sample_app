require 'spec_helper'

describe "activos/edit" do
  before(:each) do
    @activo = assign(:activo, stub_model(Activo,
      :clave => "MyString",
      :descripcion => "MyString",
      :costo_revision => ""
    ))
  end

  it "renders the edit activo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => activos_path(@activo), :method => "post" do
      assert_select "input#activo_clave", :name => "activo[clave]"
      assert_select "input#activo_descripcion", :name => "activo[descripcion]"
      assert_select "input#activo_costo_revision", :name => "activo[costo_revision]"
    end
  end
end
