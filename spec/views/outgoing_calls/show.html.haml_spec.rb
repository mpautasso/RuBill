require 'spec_helper'

describe "outgoing_calls/show.html.haml" do
  before(:each) do
    @outgoing_call = assign(:outgoing_call, stub_model(OutgoingCall,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Clid/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Src/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dst/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dcontext/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Channel/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dstchannel/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lastapp/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lastdata/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Disposition/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Accountcode/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Userfield/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
