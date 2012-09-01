require "spec_helper"

describe UseresController do
  describe "routing" do

    it "routes to #index" do
      get("/useres").should route_to("useres#index")
    end

    it "routes to #new" do
      get("/useres/new").should route_to("useres#new")
    end

    it "routes to #show" do
      get("/useres/1").should route_to("useres#show", :id => "1")
    end

    it "routes to #edit" do
      get("/useres/1/edit").should route_to("useres#edit", :id => "1")
    end

    it "routes to #create" do
      post("/useres").should route_to("useres#create")
    end

    it "routes to #update" do
      put("/useres/1").should route_to("useres#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/useres/1").should route_to("useres#destroy", :id => "1")
    end

  end
end
