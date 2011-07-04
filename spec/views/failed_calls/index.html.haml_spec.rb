require 'spec_helper'

describe "failed_calls/index.html.haml" do
  before(:each) do
    assign(:failed_calls, [
      stub_model(FailedCall,
        :src => "Src",
        :dst => "Dst",
        :duration => 1,
        :billsec => 1
      ),
      stub_model(FailedCall,
        :src => "Src",
        :dst => "Dst",
        :duration => 1,
        :billsec => 1
      )
    ])
  end

  it "renders a list of failed_calls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Src".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dst".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
