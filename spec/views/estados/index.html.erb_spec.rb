require 'spec_helper'

describe "estados/index" do
  before(:each) do
    assign(:estados, [
      stub_model(Estado,
        :clave => "Clave",
        :descripcion => "Descripcion",
        :color_estado => "Color Estado"
      ),
      stub_model(Estado,
        :clave => "Clave",
        :descripcion => "Descripcion",
        :color_estado => "Color Estado"
      )
    ])
  end

  it "renders a list of estados" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Clave".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
    assert_select "tr>td", :text => "Color Estado".to_s, :count => 2
  end
end
