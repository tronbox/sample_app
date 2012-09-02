require 'spec_helper'

describe "naves/new" do
  before(:each) do
    assign(:nave, stub_model(Nave,
      :clave => "MyString",
      :nombre => "MyString"
    ).as_new_record)
  end

  it "renders new nave form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => naves_path, :method => "post" do
      assert_select "input#nave_clave", :name => "nave[clave]"
      assert_select "input#nave_nombre", :name => "nave[nombre]"
    end
  end
end
