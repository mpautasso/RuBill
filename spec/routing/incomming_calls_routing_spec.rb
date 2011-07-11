require "spec_helper"

describe IncommingCallsController do
  describe "routing" do

    it "routes to #index" do
      get("/incomming_calls").should route_to("incomming_calls#index")
    end

    it "routes to #new" do
      get("/incomming_calls/new").should route_to("incomming_calls#new")
    end

    it "routes to #show" do
      get("/incomming_calls/1").should route_to("incomming_calls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/incomming_calls/1/edit").should route_to("incomming_calls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/incomming_calls").should route_to("incomming_calls#create")
    end

    it "routes to #update" do
      put("/incomming_calls/1").should route_to("incomming_calls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/incomming_calls/1").should route_to("incomming_calls#destroy", :id => "1")
    end

  end
end
