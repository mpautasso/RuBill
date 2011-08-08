class CreateCsvFiles < ActiveRecord::Migration
  def self.up
    create_table :csv_files do |t|
      t.string :file_name
      t.integer :user_id
      t.boolean :imported

      t.timestamps
    end
  end

  def self.down
    drop_table :csv_files
  end
end
