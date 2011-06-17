require 'spec_helper'

describe "rates/new.html.haml" do
  before(:each) do
    assign(:rate, stub_model(Rate,
      :prefix => "MyString",
      :initial_time => 1,
      :initial_cost => 1,
      :interval => 1,
      :interval_cost => 1
    ).as_new_record)
  end

  it "renders new rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rates_path, :method => "post" do
      assert_select "input#rate_prefix", :name => "rate[prefix]"
      assert_select "input#rate_initial_time", :name => "rate[initial_time]"
      assert_select "input#rate_initial_cost", :name => "rate[initial_cost]"
      assert_select "input#rate_interval", :name => "rate[interval]"
      assert_select "input#rate_interval_cost", :name => "rate[interval_cost]"
    end
  end
end
