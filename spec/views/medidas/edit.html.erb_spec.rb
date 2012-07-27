require 'spec_helper'

describe "medidas/edit" do
  before(:each) do
    @medida = assign(:medida, stub_model(Medida,
      :clave => "MyString",
      :descripcion => "MyString"
    ))
  end

  it "renders the edit medida form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => medidas_path(@medida), :method => "post" do
      assert_select "input#medida_clave", :name => "medida[clave]"
      assert_select "input#medida_descripcion", :name => "medida[descripcion]"
    end
  end
end
