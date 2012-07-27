require 'spec_helper'

describe "reparaciones/index" do
  before(:each) do
    assign(:reparaciones, [
      stub_model(Reparacion,
        :clave => "Clave",
        :descripcion => "Descripcion"
      ),
      stub_model(Reparacion,
        :clave => "Clave",
        :descripcion => "Descripcion"
      )
    ])
  end

  it "renders a list of reparaciones" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Clave".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
  end
end
