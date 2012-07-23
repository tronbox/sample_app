require 'spec_helper'

describe "fallas/edit" do
  before(:each) do
    @falla = assign(:falla, stub_model(Falla,
      :clave => "MyString",
      :descripcion => "MyString"
    ))
  end

  it "renders the edit falla form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fallas_path(@falla), :method => "post" do
      assert_select "input#falla_clave", :name => "falla[clave]"
      assert_select "input#falla_descripcion", :name => "falla[descripcion]"
    end
  end
end
