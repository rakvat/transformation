require "spec_helper"

describe UserStepsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_steps").should route_to("user_steps#index")
    end

    it "routes to #new" do
      get("/user_steps/new").should route_to("user_steps#new")
    end

    it "routes to #show" do
      get("/user_steps/1").should route_to("user_steps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_steps/1/edit").should route_to("user_steps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_steps").should route_to("user_steps#create")
    end

    it "routes to #update" do
      put("/user_steps/1").should route_to("user_steps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_steps/1").should route_to("user_steps#destroy", :id => "1")
    end

  end
end
