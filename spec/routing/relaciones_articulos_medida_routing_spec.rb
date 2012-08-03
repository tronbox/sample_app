require "spec_helper"

describe RelacionesArticulosMedidaController do
  describe "routing" do

    it "routes to #index" do
      get("/relaciones_articulos_medida").should route_to("relaciones_articulos_medida#index")
    end

    it "routes to #new" do
      get("/relaciones_articulos_medida/new").should route_to("relaciones_articulos_medida#new")
    end

    it "routes to #show" do
      get("/relaciones_articulos_medida/1").should route_to("relaciones_articulos_medida#show", :id => "1")
    end

    it "routes to #edit" do
      get("/relaciones_articulos_medida/1/edit").should route_to("relaciones_articulos_medida#edit", :id => "1")
    end

    it "routes to #create" do
      post("/relaciones_articulos_medida").should route_to("relaciones_articulos_medida#create")
    end

    it "routes to #update" do
      put("/relaciones_articulos_medida/1").should route_to("relaciones_articulos_medida#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/relaciones_articulos_medida/1").should route_to("relaciones_articulos_medida#destroy", :id => "1")
    end

  end
end
