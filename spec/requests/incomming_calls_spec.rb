require 'spec_helper'

describe "IncommingCalls" do
  describe "GET /incomming_calls" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get incomming_calls_path
      response.status.should be(200)
    end
  end
end
