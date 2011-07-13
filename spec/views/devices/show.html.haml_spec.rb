require 'spec_helper'

describe "devices/show.html.haml" do
  before(:each) do
    @device = assign(:device, stub_model(Device,
      :user_id => 1,
      :exten => "Exten",
      :priority => 1,
      :app => "App",
      :app_data => "App Data"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Exten/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/App/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/App Data/)
  end
end
