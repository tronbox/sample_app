require 'spec_helper'

describe "estados/new" do
  before(:each) do
    assign(:estado, stub_model(Estado,
      :clave => "MyString",
      :descripcion => "MyString",
      :color_estado => "MyString"
    ).as_new_record)
  end

  it "renders new estado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => estados_path, :method => "post" do
      assert_select "input#estado_clave", :name => "estado[clave]"
      assert_select "input#estado_descripcion", :name => "estado[descripcion]"
      assert_select "input#estado_color_estado", :name => "estado[color_estado]"
    end
  end
end
