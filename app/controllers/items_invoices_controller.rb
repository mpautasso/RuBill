class ItemsInvoicesController < ApplicationController
  before_filter :authenticate
  
#  active_scaffold :items_invoices do |conf|
#     global_as_config(conf)
#     
#     conf.sti_children = [:call]
#     
#     conf.nested.add_scoped_link(:type) 
#  end
end 
