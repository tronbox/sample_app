require 'spec_helper'

describe "relaciones_articulos_medida/new" do
  before(:each) do
    assign(:relacion_articulo_medida, stub_model(RelacionArticuloMedida,
      :articulo => nil,
      :medida => nil,
      :unidades_por_empaque => 1
    ).as_new_record)
  end

  it "renders new relacion_articulo_medida form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => relaciones_articulos_medida_path, :method => "post" do
      assert_select "input#relacion_articulo_medida_articulo", :name => "relacion_articulo_medida[articulo]"
      assert_select "input#relacion_articulo_medida_medida", :name => "relacion_articulo_medida[medida]"
      assert_select "input#relacion_articulo_medida_unidades_por_empaque", :name => "relacion_articulo_medida[unidades_por_empaque]"
    end
  end
end
