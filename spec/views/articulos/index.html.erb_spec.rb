require 'spec_helper'

describe "articulos/index" do
  before(:each) do
    assign(:articulos, [
      stub_model(Articulo,
        :clave => "Clave",
        :descripcion => "Descripcion",
        :descripcion_larga => "Descripcion Larga"
      ),
      stub_model(Articulo,
        :clave => "Clave",
        :descripcion => "Descripcion",
        :descripcion_larga => "Descripcion Larga"
      )
    ])
  end

  it "renders a list of articulos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Clave".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion Larga".to_s, :count => 2
  end
end
