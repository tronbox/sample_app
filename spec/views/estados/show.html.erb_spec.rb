require 'spec_helper'

describe "estados/show" do
  before(:each) do
    @estado = assign(:estado, stub_model(Estado,
      :clave => "Clave",
      :descripcion => "Descripcion",
      :color_estado => "Color Estado"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Clave/)
    rendered.should match(/Descripcion/)
    rendered.should match(/Color Estado/)
  end
end
