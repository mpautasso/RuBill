class ChangeDeviceIdToIncommingCalls < ActiveRecord::Migration
  def self.up
    change_column :incomming_calls, :device_id, :string
  end

  def self.down
    change_column :incomming_calls, :device_id, :integer
  end

end

