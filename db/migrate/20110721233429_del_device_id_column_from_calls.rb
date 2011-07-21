class DelDeviceIdColumnFromCalls < ActiveRecord::Migration
  def self.up
    remove_column :outgoing_calls, :device_id
    remove_column :incomming_calls, :device_id
    remove_column :failed_calls, :device_id
  end

  def self.down
    add_column :outgoing_calls, :device_id, :integer
    add_column :incomming_calls, :device_id, :integer
    add_column :failed_calls, :device_id, :integer
  end
end
