require 'spec_helper'

describe "areas/index" do
  before(:each) do
    assign(:areas, [
      stub_model(Area,
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
      ),
      stub_model(Area,
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
      )
    ])
  end

  it "renders a list of areas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Clave".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
    assert_select "tr>td", :text => "Calle".to_s, :count => 2
    assert_select "tr>td", :text => "Numero Exterior".to_s, :count => 2
    assert_select "tr>td", :text => "Numero Interior".to_s, :count => 2
    assert_select "tr>td", :text => "Colonia".to_s, :count => 2
    assert_select "tr>td", :text => "Localidad".to_s, :count => 2
    assert_select "tr>td", :text => "Municipio".to_s, :count => 2
    assert_select "tr>td", :text => "Codigo Postal".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono".to_s, :count => 2
    assert_select "tr>td", :text => "Correo Electronico".to_s, :count => 2
  end
end
