class ChangeDeviceIdToFailedCalls < ActiveRecord::Migration
  def self.up
    change_column :failed_calls, :device_id, :string
  end

  def self.down
    change_column :failed_calls, :device_id, :integer
  end
end
