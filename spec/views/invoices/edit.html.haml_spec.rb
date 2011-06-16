require 'spec_helper'

describe "invoices/edit.html.haml" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
      :user_id => 1
    ))
  end

  it "renders the edit invoice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invoices_path(@invoice), :method => "post" do
      assert_select "input#invoice_user_id", :name => "invoice[user_id]"
    end
  end
end
