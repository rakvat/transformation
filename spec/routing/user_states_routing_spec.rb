require "spec_helper"

describe UserStatesController do
  describe "routing" do

    it "routes to #index" do
      get("/user_states").should route_to("user_states#index")
    end

    it "routes to #new" do
      get("/user_states/new").should route_to("user_states#new")
    end

    it "routes to #show" do
      get("/user_states/1").should route_to("user_states#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_states/1/edit").should route_to("user_states#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_states").should route_to("user_states#create")
    end

    it "routes to #update" do
      put("/user_states/1").should route_to("user_states#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_states/1").should route_to("user_states#destroy", :id => "1")
    end

  end
end
