require 'spec_helper'

describe "articulos/new" do
  before(:each) do
    assign(:articulo, stub_model(Articulo,
      :clave => "MyString",
      :descripcion => "MyString",
      :descripcion_larga => "MyString"
    ).as_new_record)
  end

  it "renders new articulo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => articulos_path, :method => "post" do
      assert_select "input#articulo_clave", :name => "articulo[clave]"
      assert_select "input#articulo_descripcion", :name => "articulo[descripcion]"
      assert_select "input#articulo_descripcion_larga", :name => "articulo[descripcion_larga]"
    end
  end
end
