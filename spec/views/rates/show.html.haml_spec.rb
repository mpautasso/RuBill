require 'spec_helper'

describe "rates/show.html.haml" do
  before(:each) do
    @rate = assign(:rate, stub_model(Rate,
      :prefix => "Prefix",
      :initial_time => 1,
      :initial_cost => 1,
      :interval => 1,
      :interval_cost => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Prefix/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
