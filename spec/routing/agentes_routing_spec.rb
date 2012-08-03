require "spec_helper"

describe AgentesController do
  describe "routing" do

    it "routes to #index" do
      get("/agentes").should route_to("agentes#index")
    end

    it "routes to #new" do
      get("/agentes/new").should route_to("agentes#new")
    end

    it "routes to #show" do
      get("/agentes/1").should route_to("agentes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/agentes/1/edit").should route_to("agentes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/agentes").should route_to("agentes#create")
    end

    it "routes to #update" do
      put("/agentes/1").should route_to("agentes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/agentes/1").should route_to("agentes#destroy", :id => "1")
    end

  end
end
