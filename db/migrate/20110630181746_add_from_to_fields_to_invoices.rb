class AddFromToFieldsToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :from, :datetime
    add_column :invoices, :to, :datetime
  end

  def self.down
    remove_column :invoices, :to
    remove_column :invoices, :from
  end
end
