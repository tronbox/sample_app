require "spec_helper"

describe ActivosController do
  describe "routing" do

    it "routes to #index" do
      get("/activos").should route_to("activos#index")
    end

    it "routes to #new" do
      get("/activos/new").should route_to("activos#new")
    end

    it "routes to #show" do
      get("/activos/1").should route_to("activos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/activos/1/edit").should route_to("activos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/activos").should route_to("activos#create")
    end

    it "routes to #update" do
      put("/activos/1").should route_to("activos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/activos/1").should route_to("activos#destroy", :id => "1")
    end

  end
end
