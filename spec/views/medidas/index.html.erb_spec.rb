require 'spec_helper'

describe "medidas/index" do
  before(:each) do
    assign(:medidas, [
      stub_model(Medida,
        :clave => "Clave",
        :descripcion => "Descripcion"
      ),
      stub_model(Medida,
        :clave => "Clave",
        :descripcion => "Descripcion"
      )
    ])
  end

  it "renders a list of medidas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Clave".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
  end
end
