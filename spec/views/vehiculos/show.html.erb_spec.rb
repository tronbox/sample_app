require 'spec_helper'

describe "vehiculos/show" do
  before(:each) do
    @vehiculo = assign(:vehiculo, stub_model(Vehiculo,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Numero De Serie/)
    rendered.should match(/Marca/)
    rendered.should match(/Linea/)
    rendered.should match(/1/)
    rendered.should match(/Procedencia/)
    rendered.should match(/2/)
    rendered.should match(/Numero De Motor/)
    rendered.should match(/Clase/)
    rendered.should match(/Tipo/)
    rendered.should match(/3/)
    rendered.should match(/Capacidad/)
    rendered.should match(/Combustible/)
    rendered.should match(/4/)
  end
end
