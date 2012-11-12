require 'spec_helper'

describe "recepciones_activos/show" do
  before(:each) do
    @recepcion_activo = assign(:recepcion_activo, stub_model(RecepcionActivo,
      :agente => nil,
      :vehiculo => nil,
      :descripcion => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
