class ChangeOutgoingcallsIntegerTypeToDecimalTypeFromCost < ActiveRecord::Migration
  def self.up
     change_column :outgoing_calls, :cost, :decimal
  end

  def self.down
     change_column :outgoing_calls, :cost, :integer
  end
end
