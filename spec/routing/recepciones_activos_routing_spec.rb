require "spec_helper"

describe RecepcionesActivosController do
  describe "routing" do

    it "routes to #index" do
      get("/recepciones_activos").should route_to("recepciones_activos#index")
    end

    it "routes to #new" do
      get("/recepciones_activos/new").should route_to("recepciones_activos#new")
    end

    it "routes to #show" do
      get("/recepciones_activos/1").should route_to("recepciones_activos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/recepciones_activos/1/edit").should route_to("recepciones_activos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/recepciones_activos").should route_to("recepciones_activos#create")
    end

    it "routes to #update" do
      put("/recepciones_activos/1").should route_to("recepciones_activos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/recepciones_activos/1").should route_to("recepciones_activos#destroy", :id => "1")
    end

  end
end
