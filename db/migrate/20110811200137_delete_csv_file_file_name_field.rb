class DeleteCsvFileFileNameField < ActiveRecord::Migration
  def self.up
    remove_column :csv_files, :file_name
  end

  def self.down
    add_column :csv_files, :file_name
  end
end
