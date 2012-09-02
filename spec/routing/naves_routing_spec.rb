require "spec_helper"

describe NavesController do
  describe "routing" do

    it "routes to #index" do
      get("/naves").should route_to("naves#index")
    end

    it "routes to #new" do
      get("/naves/new").should route_to("naves#new")
    end

    it "routes to #show" do
      get("/naves/1").should route_to("naves#show", :id => "1")
    end

    it "routes to #edit" do
      get("/naves/1/edit").should route_to("naves#edit", :id => "1")
    end

    it "routes to #create" do
      post("/naves").should route_to("naves#create")
    end

    it "routes to #update" do
      put("/naves/1").should route_to("naves#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/naves/1").should route_to("naves#destroy", :id => "1")
    end

  end
end
