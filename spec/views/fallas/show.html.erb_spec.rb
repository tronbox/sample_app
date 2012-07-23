require 'spec_helper'

describe "fallas/show" do
  before(:each) do
    @falla = assign(:falla, stub_model(Falla,
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
