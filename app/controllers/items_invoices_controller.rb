class ItemsInvoicesController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :items do |conf|
     global_as_config(conf)
  end
end 
