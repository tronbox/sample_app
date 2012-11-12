require 'spec_helper'

describe "vehiculos/index" do
  before(:each) do
    assign(:vehiculos, [
      stub_model(Vehiculo,
        :numero_de_serie => "Numero De Serie",
        :marca => "Marca",
        :linea => "Linea",
        :modelo => 1,
        :procedencia => "Procedencia",
        :cilindros => 2,
        :numero_de_motor => "Numero De Motor",
        :clase => "Clase",
        :tipo => "Tipo",
        :clave_vehicular => 3,
        :capacidad => "Capacidad",
        :combustible => "Combustible",
        :numero_de_puertas => 4
      ),
      stub_model(Vehiculo,
        :numero_de_serie => "Numero De Serie",
        :marca => "Marca",
        :linea => "Linea",
        :modelo => 1,
        :procedencia => "Procedencia",
        :cilindros => 2,
        :numero_de_motor => "Numero De Motor",
        :clase => "Clase",
        :tipo => "Tipo",
        :clave_vehicular => 3,
        :capacidad => "Capacidad",
        :combustible => "Combustible",
        :numero_de_puertas => 4
      )
    ])
  end

  it "renders a list of vehiculos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Numero De Serie".to_s, :count => 2
    assert_select "tr>td", :text => "Marca".to_s, :count => 2
    assert_select "tr>td", :text => "Linea".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Procedencia".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Numero De Motor".to_s, :count => 2
    assert_select "tr>td", :text => "Clase".to_s, :count => 2
    assert_select "tr>td", :text => "Tipo".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Capacidad".to_s, :count => 2
    assert_select "tr>td", :text => "Combustible".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
