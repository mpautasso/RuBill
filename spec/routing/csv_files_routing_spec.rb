require "spec_helper"

describe CsvFilesController do
  describe "routing" do

    it "routes to #index" do
      get("/csv_files").should route_to("csv_files#index")
    end

    it "routes to #new" do
      get("/csv_files/new").should route_to("csv_files#new")
    end

    it "routes to #show" do
      get("/csv_files/1").should route_to("csv_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/csv_files/1/edit").should route_to("csv_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/csv_files").should route_to("csv_files#create")
    end

    it "routes to #update" do
      put("/csv_files/1").should route_to("csv_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/csv_files/1").should route_to("csv_files#destroy", :id => "1")
    end

  end
end
