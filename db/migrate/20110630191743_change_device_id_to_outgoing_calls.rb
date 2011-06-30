class ChangeDeviceIdToOutgoingCalls < ActiveRecord::Migration
  def self.up
    change_column :outgoing_calls, :device_id, :string
  end

  def self.down
    change_column :outgoing_calls, :device_id, :integer
  end
end
