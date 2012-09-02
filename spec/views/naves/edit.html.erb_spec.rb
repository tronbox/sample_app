require 'spec_helper'

describe "naves/edit" do
  before(:each) do
    @nave = assign(:nave, stub_model(Nave,
      :clave => "MyString",
      :nombre => "MyString"
    ))
  end

  it "renders the edit nave form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => naves_path(@nave), :method => "post" do
      assert_select "input#nave_clave", :name => "nave[clave]"
      assert_select "input#nave_nombre", :name => "nave[nombre]"
    end
  end
end
