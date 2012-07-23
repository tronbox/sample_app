require 'spec_helper'

describe "activos/show" do
  before(:each) do
    @activo = assign(:activo, stub_model(Activo,
      :clave => "Clave",
      :descripcion => "Descripcion",
      :costo_revision => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Clave/)
    rendered.should match(/Descripcion/)
    rendered.should match(//)
  end
end
