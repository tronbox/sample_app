require "spec_helper"

describe OrdenesServiciosController do
  describe "routing" do

    it "routes to #index" do
      get("/ordenes_servicios").should route_to("ordenes_servicios#index")
    end

    it "routes to #new" do
      get("/ordenes_servicios/new").should route_to("ordenes_servicios#new")
    end

    it "routes to #show" do
      get("/ordenes_servicios/1").should route_to("ordenes_servicios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ordenes_servicios/1/edit").should route_to("ordenes_servicios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ordenes_servicios").should route_to("ordenes_servicios#create")
    end

    it "routes to #update" do
      put("/ordenes_servicios/1").should route_to("ordenes_servicios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ordenes_servicios/1").should route_to("ordenes_servicios#destroy", :id => "1")
    end

  end
end
