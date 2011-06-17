class CreateRates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.string :prefix
      t.integer :initial_time
      t.integer :initial_cost
      t.integer :interval
      t.integer :interval_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :rates
  end
end
