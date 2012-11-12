require 'spec_helper'

describe "vehiculos/new" do
  before(:each) do
    assign(:vehiculo, stub_model(Vehiculo,
      :numero_de_serie => "MyString",
      :marca => "MyString",
      :linea => "MyString",
      :modelo => 1,
      :procedencia => "MyString",
      :cilindros => 1,
      :numero_de_motor => "MyString",
      :clase => "MyString",
      :tipo => "MyString",
      :clave_vehicular => 1,
      :capacidad => "MyString",
      :combustible => "MyString",
      :numero_de_puertas => 1
    ).as_new_record)
  end

  it "renders new vehiculo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vehiculos_path, :method => "post" do
      assert_select "input#vehiculo_numero_de_serie", :name => "vehiculo[numero_de_serie]"
      assert_select "input#vehiculo_marca", :name => "vehiculo[marca]"
      assert_select "input#vehiculo_linea", :name => "vehiculo[linea]"
      assert_select "input#vehiculo_modelo", :name => "vehiculo[modelo]"
      assert_select "input#vehiculo_procedencia", :name => "vehiculo[procedencia]"
      assert_select "input#vehiculo_cilindros", :name => "vehiculo[cilindros]"
      assert_select "input#vehiculo_numero_de_motor", :name => "vehiculo[numero_de_motor]"
      assert_select "input#vehiculo_clase", :name => "vehiculo[clase]"
      assert_select "input#vehiculo_tipo", :name => "vehiculo[tipo]"
      assert_select "input#vehiculo_clave_vehicular", :name => "vehiculo[clave_vehicular]"
      assert_select "input#vehiculo_capacidad", :name => "vehiculo[capacidad]"
      assert_select "input#vehiculo_combustible", :name => "vehiculo[combustible]"
      assert_select "input#vehiculo_numero_de_puertas", :name => "vehiculo[numero_de_puertas]"
    end
  end
end
