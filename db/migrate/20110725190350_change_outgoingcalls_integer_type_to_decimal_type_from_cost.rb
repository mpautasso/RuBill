class ChangeOutgoingcallsIntegerTypeToDecimalTypeFromCost < ActiveRecord::Migration
  def self.up
     change_column :outgoing_calls, :cost, :decimal, :precision => 6, :scale => 2, :null => false, :default => 0
  end

  def self.down
     change_column :outgoing_calls, :cost, :integer
  end
end
