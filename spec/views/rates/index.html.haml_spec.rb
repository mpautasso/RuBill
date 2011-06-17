require 'spec_helper'

describe "rates/index.html.haml" do
  before(:each) do
    assign(:rates, [
      stub_model(Rate,
        :prefix => "Prefix",
        :initial_time => 1,
        :initial_cost => 1,
        :interval => 1,
        :interval_cost => 1
      ),
      stub_model(Rate,
        :prefix => "Prefix",
        :initial_time => 1,
        :initial_cost => 1,
        :interval => 1,
        :interval_cost => 1
      )
    ])
  end

  it "renders a list of rates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Prefix".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
