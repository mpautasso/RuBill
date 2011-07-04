require "spec_helper"

describe FailedCallsController do
  describe "routing" do

    it "routes to #index" do
      get("/failed_calls").should route_to("failed_calls#index")
    end

    it "routes to #new" do
      get("/failed_calls/new").should route_to("failed_calls#new")
    end

    it "routes to #show" do
      get("/failed_calls/1").should route_to("failed_calls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/failed_calls/1/edit").should route_to("failed_calls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/failed_calls").should route_to("failed_calls#create")
    end

    it "routes to #update" do
      put("/failed_calls/1").should route_to("failed_calls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/failed_calls/1").should route_to("failed_calls#destroy", :id => "1")
    end

  end
end
