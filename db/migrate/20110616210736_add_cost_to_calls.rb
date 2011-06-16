class AddCostToCalls < ActiveRecord::Migration
  def self.up
    add_column :calls, :cost, :integer
  end

  def self.down
    remove_column :calls, :cost
  end
end
