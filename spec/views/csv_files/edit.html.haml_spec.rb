require 'spec_helper'

describe "csv_files/edit.html.haml" do
  before(:each) do
    @csv_file = assign(:csv_file, stub_model(CsvFile,
      :file_name => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit csv_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => csv_files_path(@csv_file), :method => "post" do
      assert_select "input#csv_file_file_name", :name => "csv_file[file_name]"
      assert_select "input#csv_file_user_id", :name => "csv_file[user_id]"
    end
  end
end
