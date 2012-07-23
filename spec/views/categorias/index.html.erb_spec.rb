require 'spec_helper'

describe "categorias/index" do
  before(:each) do
    assign(:categorias, [
      stub_model(Categoria,
        :clave => "Clave",
        :descripcion => "Descripcion"
      ),
      stub_model(Categoria,
        :clave => "Clave",
        :descripcion => "Descripcion"
      )
    ])
  end

  it "renders a list of categorias" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Clave".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
  end
end
