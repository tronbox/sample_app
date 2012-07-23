require "spec_helper"

describe FallasController do
  describe "routing" do

    it "routes to #index" do
      get("/fallas").should route_to("fallas#index")
    end

    it "routes to #new" do
      get("/fallas/new").should route_to("fallas#new")
    end

    it "routes to #show" do
      get("/fallas/1").should route_to("fallas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fallas/1/edit").should route_to("fallas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fallas").should route_to("fallas#create")
    end

    it "routes to #update" do
      put("/fallas/1").should route_to("fallas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fallas/1").should route_to("fallas#destroy", :id => "1")
    end

  end
end
