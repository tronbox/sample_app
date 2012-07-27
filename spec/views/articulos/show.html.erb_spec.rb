require 'spec_helper'

describe "articulos/show" do
  before(:each) do
    @articulo = assign(:articulo, stub_model(Articulo,
      :clave => "Clave",
      :descripcion => "Descripcion",
      :descripcion_larga => "Descripcion Larga"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Clave/)
    rendered.should match(/Descripcion/)
    rendered.should match(/Descripcion Larga/)
  end
end
