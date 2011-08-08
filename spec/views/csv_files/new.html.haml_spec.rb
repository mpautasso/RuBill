require 'spec_helper'

describe "csv_files/new.html.haml" do
  before(:each) do
    assign(:csv_file, stub_model(CsvFile,
      :file_name => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new csv_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => csv_files_path, :method => "post" do
      assert_select "input#csv_file_file_name", :name => "csv_file[file_name]"
      assert_select "input#csv_file_user_id", :name => "csv_file[user_id]"
    end
  end
end
