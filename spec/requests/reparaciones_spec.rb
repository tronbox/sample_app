require 'spec_helper'

describe "Reparaciones" do
  describe "GET /reparaciones" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get reparaciones_path
      response.status.should be(200)
    end
  end
end
