require "spec_helper"

describe VehiculosController do
  describe "routing" do

    it "routes to #index" do
      get("/vehiculos").should route_to("vehiculos#index")
    end

    it "routes to #new" do
      get("/vehiculos/new").should route_to("vehiculos#new")
    end

    it "routes to #show" do
      get("/vehiculos/1").should route_to("vehiculos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehiculos/1/edit").should route_to("vehiculos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehiculos").should route_to("vehiculos#create")
    end

    it "routes to #update" do
      put("/vehiculos/1").should route_to("vehiculos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehiculos/1").should route_to("vehiculos#destroy", :id => "1")
    end

  end
end
