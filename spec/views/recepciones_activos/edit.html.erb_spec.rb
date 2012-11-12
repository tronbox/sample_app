require 'spec_helper'

describe "recepciones_activos/edit" do
  before(:each) do
    @recepcion_activo = assign(:recepcion_activo, stub_model(RecepcionActivo,
      :agente => nil,
      :vehiculo => nil,
      :descripcion => "MyText"
    ))
  end

  it "renders the edit recepcion_activo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recepciones_activos_path(@recepcion_activo), :method => "post" do
      assert_select "input#recepcion_activo_agente", :name => "recepcion_activo[agente]"
      assert_select "input#recepcion_activo_vehiculo", :name => "recepcion_activo[vehiculo]"
      assert_select "textarea#recepcion_activo_descripcion", :name => "recepcion_activo[descripcion]"
    end
  end
end
