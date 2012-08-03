require 'spec_helper'

describe "agentes/edit" do
  before(:each) do
    @agente = assign(:agente, stub_model(Agente,
      :clave => "MyString",
      :nombre => "MyString"
    ))
  end

  it "renders the edit agente form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => agentes_path(@agente), :method => "post" do
      assert_select "input#agente_clave", :name => "agente[clave]"
      assert_select "input#agente_nombre", :name => "agente[nombre]"
    end
  end
end
