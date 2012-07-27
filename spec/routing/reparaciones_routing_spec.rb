require "spec_helper"

describe ReparacionesController do
  describe "routing" do

    it "routes to #index" do
      get("/reparaciones").should route_to("reparaciones#index")
    end

    it "routes to #new" do
      get("/reparaciones/new").should route_to("reparaciones#new")
    end

    it "routes to #show" do
      get("/reparaciones/1").should route_to("reparaciones#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reparaciones/1/edit").should route_to("reparaciones#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reparaciones").should route_to("reparaciones#create")
    end

    it "routes to #update" do
      put("/reparaciones/1").should route_to("reparaciones#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reparaciones/1").should route_to("reparaciones#destroy", :id => "1")
    end

  end
end
