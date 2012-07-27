require 'spec_helper'

describe "areas/show" do
  before(:each) do
    @area = assign(:area, stub_model(Area,
      :clave => "Clave",
      :descripcion => "Descripcion",
      :calle => "Calle",
      :numero_exterior => "Numero Exterior",
      :numero_interior => "Numero Interior",
      :colonia => "Colonia",
      :localidad => "Localidad",
      :municipio => "Municipio",
      :codigo_postal => "Codigo Postal",
      :telefono => "Telefono",
      :correo_electronico => "Correo Electronico"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Clave/)
    rendered.should match(/Descripcion/)
    rendered.should match(/Calle/)
    rendered.should match(/Numero Exterior/)
    rendered.should match(/Numero Interior/)
    rendered.should match(/Colonia/)
    rendered.should match(/Localidad/)
    rendered.should match(/Municipio/)
    rendered.should match(/Codigo Postal/)
    rendered.should match(/Telefono/)
    rendered.should match(/Correo Electronico/)
  end
end
