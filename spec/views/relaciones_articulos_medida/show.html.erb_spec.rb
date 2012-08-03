require 'spec_helper'

describe "relaciones_articulos_medida/show" do
  before(:each) do
    @relacion_articulo_medida = assign(:relacion_articulo_medida, stub_model(RelacionArticuloMedida,
      :articulo => nil,
      :medida => nil,
      :unidades_por_empaque => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
