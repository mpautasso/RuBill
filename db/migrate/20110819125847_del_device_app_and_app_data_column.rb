class DelDeviceAppAndAppDataColumn < ActiveRecord::Migration
  def self.up
    remove_column :devices, :app
    remove_column :devices, :app_data
  end

  def self.down
    add_column :devices, :app, :string
    add_column :devices, :app_data, :string
  end
end
