require 'spec_helper'

describe "naves/show" do
  before(:each) do
    @nave = assign(:nave, stub_model(Nave,
      :clave => "Clave",
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Clave/)
    rendered.should match(/Nombre/)
  end
end
