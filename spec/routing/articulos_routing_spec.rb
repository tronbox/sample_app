require "spec_helper"

describe ArticulosController do
  describe "routing" do

    it "routes to #index" do
      get("/articulos").should route_to("articulos#index")
    end

    it "routes to #new" do
      get("/articulos/new").should route_to("articulos#new")
    end

    it "routes to #show" do
      get("/articulos/1").should route_to("articulos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/articulos/1/edit").should route_to("articulos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/articulos").should route_to("articulos#create")
    end

    it "routes to #update" do
      put("/articulos/1").should route_to("articulos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/articulos/1").should route_to("articulos#destroy", :id => "1")
    end

  end
end
