require 'spec_helper'

describe "OutgoingCalls" do
  describe "GET /outgoing_calls" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get outgoing_calls_path
      response.status.should be(200)
    end
  end
end
