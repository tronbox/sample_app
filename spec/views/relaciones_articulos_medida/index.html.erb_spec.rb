require 'spec_helper'

describe "relaciones_articulos_medida/index" do
  before(:each) do
    assign(:relaciones_articulos_medida, [
      stub_model(RelacionArticuloMedida,
        :articulo => nil,
        :medida => nil,
        :unidades_por_empaque => 1
      ),
      stub_model(RelacionArticuloMedida,
        :articulo => nil,
        :medida => nil,
        :unidades_por_empaque => 1
      )
    ])
  end

  it "renders a list of relaciones_articulos_medida" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
