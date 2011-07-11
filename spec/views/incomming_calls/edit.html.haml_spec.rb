require 'spec_helper'

describe "incomming_calls/edit.html.haml" do
  before(:each) do
    @incomming_call = assign(:incomming_call, stub_model(IncommingCall,
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
      :invoice_id => 1,
      :device_id => "MyString"
    ))
  end

  it "renders the edit incomming_call form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => incomming_calls_path(@incomming_call), :method => "post" do
      assert_select "input#incomming_call_clid", :name => "incomming_call[clid]"
      assert_select "input#incomming_call_src", :name => "incomming_call[src]"
      assert_select "input#incomming_call_dst", :name => "incomming_call[dst]"
      assert_select "input#incomming_call_dcontext", :name => "incomming_call[dcontext]"
      assert_select "input#incomming_call_channel", :name => "incomming_call[channel]"
      assert_select "input#incomming_call_dstchannel", :name => "incomming_call[dstchannel]"
      assert_select "input#incomming_call_lastapp", :name => "incomming_call[lastapp]"
      assert_select "input#incomming_call_lastdata", :name => "incomming_call[lastdata]"
      assert_select "input#incomming_call_duration", :name => "incomming_call[duration]"
      assert_select "input#incomming_call_billsec", :name => "incomming_call[billsec]"
      assert_select "input#incomming_call_disposition", :name => "incomming_call[disposition]"
      assert_select "input#incomming_call_amaflags", :name => "incomming_call[amaflags]"
      assert_select "input#incomming_call_accountcode", :name => "incomming_call[accountcode]"
      assert_select "input#incomming_call_userfield", :name => "incomming_call[userfield]"
      assert_select "input#incomming_call_invoice_id", :name => "incomming_call[invoice_id]"
      assert_select "input#incomming_call_device_id", :name => "incomming_call[device_id]"
    end
  end
end
