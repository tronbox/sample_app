require 'spec_helper'

describe "medidas/show" do
  before(:each) do
    @medida = assign(:medida, stub_model(Medida,
      :clave => "Clave",
      :descripcion => "Descripcion"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Clave/)
    rendered.should match(/Descripcion/)
  end
end
