require 'spec_helper'

describe "useres/index" do
  before(:each) do
    assign(:useres, [
      stub_model(User),
      stub_model(User)
    ])
  end

  it "renders a list of useres" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
