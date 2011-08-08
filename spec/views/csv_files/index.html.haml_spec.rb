require 'spec_helper'

describe "csv_files/index.html.haml" do
  before(:each) do
    assign(:csv_files, [
      stub_model(CsvFile,
        :file_name => "File Name",
        :user_id => 1
      ),
      stub_model(CsvFile,
        :file_name => "File Name",
        :user_id => 1
      )
    ])
  end

  it "renders a list of csv_files" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
