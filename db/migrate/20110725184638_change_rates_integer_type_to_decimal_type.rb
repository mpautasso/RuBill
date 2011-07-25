class ChangeRatesIntegerTypeToDecimalType < ActiveRecord::Migration
  def self.up
    change_column :rates, :initial_cost, :decimal
    change_column :rates, :interval_cost, :decimal    
  end

  def self.down
    change_column :rates, :initial_cost, :integer
    change_column :rates, :interval_cost, :integer    
  end
end
