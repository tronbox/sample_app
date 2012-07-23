require 'spec_helper'

describe "fallas/index" do
  before(:each) do
    assign(:fallas, [
      stub_model(Falla,
        :clave => "Clave",
        :descripcion => "Descripcion"
      ),
      stub_model(Falla,
        :clave => "Clave",
        :descripcion => "Descripcion"
      )
    ])
  end

  it "renders a list of fallas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Clave".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
  end
end
