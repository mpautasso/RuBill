class ChangeRatesIntegerTypeToDecimalType < ActiveRecord::Migration
  def self.up
    change_column :rates, :initial_cost, :decimal, :precision => 6, :scale => 2, :null => false, :default => 0
    change_column :rates, :interval_cost, :decimal, :precision => 6, :scale => 2, :null => false, :default => 0
  end

  def self.down
    change_column :rates, :initial_cost, :integer
    change_column :rates, :interval_cost, :integer    
  end
end
