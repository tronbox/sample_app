require "spec_helper"

describe MedidasController do
  describe "routing" do

    it "routes to #index" do
      get("/medidas").should route_to("medidas#index")
    end

    it "routes to #new" do
      get("/medidas/new").should route_to("medidas#new")
    end

    it "routes to #show" do
      get("/medidas/1").should route_to("medidas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/medidas/1/edit").should route_to("medidas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/medidas").should route_to("medidas#create")
    end

    it "routes to #update" do
      put("/medidas/1").should route_to("medidas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/medidas/1").should route_to("medidas#destroy", :id => "1")
    end

  end
end
