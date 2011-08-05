class AddTotalToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :total, :decimal, :precision => 6, :scale => 2, :null => false, :default => 0
  end

  def self.down
    remove_column :invoices, :total
  end
end
