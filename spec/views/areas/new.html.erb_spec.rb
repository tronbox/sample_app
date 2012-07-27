require 'spec_helper'

describe "areas/new" do
  before(:each) do
    assign(:area, stub_model(Area,
      :clave => "MyString",
      :descripcion => "MyString",
      :calle => "MyString",
      :numero_exterior => "MyString",
      :numero_interior => "MyString",
      :colonia => "MyString",
      :localidad => "MyString",
      :municipio => "MyString",
      :codigo_postal => "MyString",
      :telefono => "MyString",
      :correo_electronico => "MyString"
    ).as_new_record)
  end

  it "renders new area form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => areas_path, :method => "post" do
      assert_select "input#area_clave", :name => "area[clave]"
      assert_select "input#area_descripcion", :name => "area[descripcion]"
      assert_select "input#area_calle", :name => "area[calle]"
      assert_select "input#area_numero_exterior", :name => "area[numero_exterior]"
      assert_select "input#area_numero_interior", :name => "area[numero_interior]"
      assert_select "input#area_colonia", :name => "area[colonia]"
      assert_select "input#area_localidad", :name => "area[localidad]"
      assert_select "input#area_municipio", :name => "area[municipio]"
      assert_select "input#area_codigo_postal", :name => "area[codigo_postal]"
      assert_select "input#area_telefono", :name => "area[telefono]"
      assert_select "input#area_correo_electronico", :name => "area[correo_electronico]"
    end
  end
end
