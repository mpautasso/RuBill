require 'spec_helper'

describe "devices/new.html.haml" do
  before(:each) do
    assign(:device, stub_model(Device,
      :user_id => 1,
      :exten => "MyString",
      :priority => 1,
      :app => "MyString",
      :app_data => "MyString"
    ).as_new_record)
  end

  it "renders new device form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => devices_path, :method => "post" do
      assert_select "input#device_user_id", :name => "device[user_id]"
      assert_select "input#device_exten", :name => "device[exten]"
      assert_select "input#device_priority", :name => "device[priority]"
      assert_select "input#device_app", :name => "device[app]"
      assert_select "input#device_app_data", :name => "device[app_data]"
    end
  end
end
