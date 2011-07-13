require 'spec_helper'

describe "devices/index.html.haml" do
  before(:each) do
    assign(:devices, [
      stub_model(Device,
        :user_id => 1,
        :exten => "Exten",
        :priority => 1,
        :app => "App",
        :app_data => "App Data"
      ),
      stub_model(Device,
        :user_id => 1,
        :exten => "Exten",
        :priority => 1,
        :app => "App",
        :app_data => "App Data"
      )
    ])
  end

  it "renders a list of devices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Exten".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "App".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "App Data".to_s, :count => 2
  end
end
