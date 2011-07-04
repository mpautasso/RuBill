require 'spec_helper'

describe "failed_calls/show.html.haml" do
  before(:each) do
    @failed_call = assign(:failed_call, stub_model(FailedCall,
      :src => "Src",
      :dst => "Dst",
      :duration => 1,
      :billsec => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Src/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dst/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
