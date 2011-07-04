class AddRateIdToOutgoingCalls < ActiveRecord::Migration
  def self.up
    add_column :outgoing_calls, :rate_id, :integer
  end

  def self.down
    remove_column :outgoing_calls, :rate_id
  end
end
