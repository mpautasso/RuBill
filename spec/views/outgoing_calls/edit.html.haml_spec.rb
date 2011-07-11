require 'spec_helper'

describe "outgoing_calls/edit.html.haml" do
  before(:each) do
    @outgoing_call = assign(:outgoing_call, stub_model(OutgoingCall,
      :clid => "MyString",
      :src => "MyString",
      :dst => "MyString",
      :dcontext => "MyString",
      :channel => "MyString",
      :dstchannel => "MyString",
      :lastapp => "MyString",
      :lastdata => "MyString",
      :duration => 1,
      :billsec => 1,
      :disposition => "MyString",
      :amaflags => 1,
      :accountcode => "MyString",
      :userfield => "MyString",
      :cost => 1,
      :invoice_id => 1,
      :device_id => 1
    ))
  end

  it "renders the edit outgoing_call form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => outgoing_calls_path(@outgoing_call), :method => "post" do
      assert_select "input#outgoing_call_clid", :name => "outgoing_call[clid]"
      assert_select "input#outgoing_call_src", :name => "outgoing_call[src]"
      assert_select "input#outgoing_call_dst", :name => "outgoing_call[dst]"
      assert_select "input#outgoing_call_dcontext", :name => "outgoing_call[dcontext]"
      assert_select "input#outgoing_call_channel", :name => "outgoing_call[channel]"
      assert_select "input#outgoing_call_dstchannel", :name => "outgoing_call[dstchannel]"
      assert_select "input#outgoing_call_lastapp", :name => "outgoing_call[lastapp]"
      assert_select "input#outgoing_call_lastdata", :name => "outgoing_call[lastdata]"
      assert_select "input#outgoing_call_duration", :name => "outgoing_call[duration]"
      assert_select "input#outgoing_call_billsec", :name => "outgoing_call[billsec]"
      assert_select "input#outgoing_call_disposition", :name => "outgoing_call[disposition]"
      assert_select "input#outgoing_call_amaflags", :name => "outgoing_call[amaflags]"
      assert_select "input#outgoing_call_accountcode", :name => "outgoing_call[accountcode]"
      assert_select "input#outgoing_call_userfield", :name => "outgoing_call[userfield]"
      assert_select "input#outgoing_call_cost", :name => "outgoing_call[cost]"
      assert_select "input#outgoing_call_invoice_id", :name => "outgoing_call[invoice_id]"
      assert_select "input#outgoing_call_device_id", :name => "outgoing_call[device_id]"
    end
  end
end
