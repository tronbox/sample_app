require 'spec_helper'

describe "ordenes_servicios/index" do
  before(:each) do
    assign(:ordenes_servicios, [
      stub_model(OrdenServicio,
        :folio => 1,
        :fecha_entrega_date => "Fecha Entrega Date",
        :descripcion => "MyText",
        :area => nil,
        :agente => nil,
        :activo => nil,
        :falla => nil,
        :series => nil
      ),
      stub_model(OrdenServicio,
        :folio => 1,
        :fecha_entrega_date => "Fecha Entrega Date",
        :descripcion => "MyText",
        :area => nil,
        :agente => nil,
        :activo => nil,
        :falla => nil,
        :series => nil
      )
    ])
  end

  it "renders a list of ordenes_servicios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Fecha Entrega Date".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
