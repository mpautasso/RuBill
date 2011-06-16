require 'spec_helper'

describe "invoices/show.html.haml" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
