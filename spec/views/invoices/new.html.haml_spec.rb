require 'spec_helper'

describe "invoices/new.html.haml" do
  before(:each) do
    assign(:invoice, stub_model(Invoice,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new invoice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invoices_path, :method => "post" do
      assert_select "input#invoice_user_id", :name => "invoice[user_id]"
    end
  end
end
