require 'spec_helper'

describe "csv_files/show.html.haml" do
  before(:each) do
    @csv_file = assign(:csv_file, stub_model(CsvFile,
      :file_name => "File Name",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
