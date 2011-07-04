require 'spec_helper'

describe "failed_calls/new.html.haml" do
  before(:each) do
    assign(:failed_call, stub_model(FailedCall,
      :src => "MyString",
      :dst => "MyString",
      :duration => 1,
      :billsec => 1
    ).as_new_record)
  end

  it "renders new failed_call form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => failed_calls_path, :method => "post" do
      assert_select "input#failed_call_src", :name => "failed_call[src]"
      assert_select "input#failed_call_dst", :name => "failed_call[dst]"
      assert_select "input#failed_call_duration", :name => "failed_call[duration]"
      assert_select "input#failed_call_billsec", :name => "failed_call[billsec]"
    end
  end
end
