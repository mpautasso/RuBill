class AddCostToCalls < ActiveRecord::Migration
  def self.up
    add_column :outgoing_calls, :cost, :integer
  end

  def self.down
    remove_column :outgoing_calls, :cost
  end
end
