require 'spec_helper'

describe "ordenes_servicios/show" do
  before(:each) do
    @orden_servicio = assign(:orden_servicio, stub_model(OrdenServicio,
      :folio => 1,
      :fecha_entrega_date => "Fecha Entrega Date",
      :descripcion => "MyText",
      :area => nil,
      :agente => nil,
      :activo => nil,
      :falla => nil,
      :series => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Fecha Entrega Date/)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
