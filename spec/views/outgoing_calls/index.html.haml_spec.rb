require 'spec_helper'

describe "outgoing_calls/index.html.haml" do
  before(:each) do
    assign(:outgoing_calls, [
      stub_model(OutgoingCall,
        :clid => "Clid",
        :src => "Src",
        :dst => "Dst",
        :dcontext => "Dcontext",
        :channel => "Channel",
        :dstchannel => "Dstchannel",
        :lastapp => "Lastapp",
        :lastdata => "Lastdata",
        :duration => 1,
        :billsec => 1,
        :disposition => "Disposition",
        :amaflags => 1,
        :accountcode => "Accountcode",
        :userfield => "Userfield",
        :cost => 1,
        :invoice_id => 1,
        :device_id => 1
      ),
      stub_model(OutgoingCall,
        :clid => "Clid",
        :src => "Src",
        :dst => "Dst",
        :dcontext => "Dcontext",
        :channel => "Channel",
        :dstchannel => "Dstchannel",
        :lastapp => "Lastapp",
        :lastdata => "Lastdata",
        :duration => 1,
        :billsec => 1,
        :disposition => "Disposition",
        :amaflags => 1,
        :accountcode => "Accountcode",
        :userfield => "Userfield",
        :cost => 1,
        :invoice_id => 1,
        :device_id => 1
      )
    ])
  end

  it "renders a list of outgoing_calls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Clid".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Src".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dst".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dcontext".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Channel".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dstchannel".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lastapp".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lastdata".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Disposition".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Accountcode".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Userfield".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
