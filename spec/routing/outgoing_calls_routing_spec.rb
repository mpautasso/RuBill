require "spec_helper"

describe OutgoingCallsController do
  describe "routing" do

    it "routes to #index" do
      get("/outgoing_calls").should route_to("outgoing_calls#index")
    end

    it "routes to #new" do
      get("/outgoing_calls/new").should route_to("outgoing_calls#new")
    end

    it "routes to #show" do
      get("/outgoing_calls/1").should route_to("outgoing_calls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/outgoing_calls/1/edit").should route_to("outgoing_calls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/outgoing_calls").should route_to("outgoing_calls#create")
    end

    it "routes to #update" do
      put("/outgoing_calls/1").should route_to("outgoing_calls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/outgoing_calls/1").should route_to("outgoing_calls#destroy", :id => "1")
    end

  end
end
