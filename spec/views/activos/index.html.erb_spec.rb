require 'spec_helper'

describe "activos/index" do
  before(:each) do
    assign(:activos, [
      stub_model(Activo,
        :clave => "Clave",
        :descripcion => "Descripcion",
        :costo_revision => ""
      ),
      stub_model(Activo,
        :clave => "Clave",
        :descripcion => "Descripcion",
        :costo_revision => ""
      )
    ])
  end

  it "renders a list of activos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Clave".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
