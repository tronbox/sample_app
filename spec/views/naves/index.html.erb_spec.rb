require 'spec_helper'

describe "naves/index" do
  before(:each) do
    assign(:naves, [
      stub_model(Nave,
        :clave => "Clave",
        :nombre => "Nombre"
      ),
      stub_model(Nave,
        :clave => "Clave",
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of naves" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Clave".to_s, :count => 2
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
