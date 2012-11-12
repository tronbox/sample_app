require 'spec_helper'

describe "recepciones_activos/index" do
  before(:each) do
    assign(:recepciones_activos, [
      stub_model(RecepcionActivo,
        :agente => nil,
        :vehiculo => nil,
        :descripcion => "MyText"
      ),
      stub_model(RecepcionActivo,
        :agente => nil,
        :vehiculo => nil,
        :descripcion => "MyText"
      )
    ])
  end

  it "renders a list of recepciones_activos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
