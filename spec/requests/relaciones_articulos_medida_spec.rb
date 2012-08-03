require 'spec_helper'

describe "RelacionesArticulosMedida" do
  describe "GET /relaciones_articulos_medida" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get relaciones_articulos_medida_path
      response.status.should be(200)
    end
  end
end
