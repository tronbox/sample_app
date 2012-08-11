require 'spec_helper'

describe "ordenes_servicios/edit" do
  before(:each) do
    @orden_servicio = assign(:orden_servicio, stub_model(OrdenServicio,
      :folio => 1,
      :fecha_entrega_date => "MyString",
      :descripcion => "MyText",
      :area => nil,
      :agente => nil,
      :activo => nil,
      :falla => nil,
      :series => nil
    ))
  end

  it "renders the edit orden_servicio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ordenes_servicios_path(@orden_servicio), :method => "post" do
      assert_select "input#orden_servicio_folio", :name => "orden_servicio[folio]"
      assert_select "input#orden_servicio_fecha_entrega_date", :name => "orden_servicio[fecha_entrega_date]"
      assert_select "textarea#orden_servicio_descripcion", :name => "orden_servicio[descripcion]"
      assert_select "input#orden_servicio_area", :name => "orden_servicio[area]"
      assert_select "input#orden_servicio_agente", :name => "orden_servicio[agente]"
      assert_select "input#orden_servicio_activo", :name => "orden_servicio[activo]"
      assert_select "input#orden_servicio_falla", :name => "orden_servicio[falla]"
      assert_select "input#orden_servicio_series", :name => "orden_servicio[series]"
    end
  end
end
