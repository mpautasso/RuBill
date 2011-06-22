class InvoicesController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :invoice do |conf|
     global_as_config(conf)
  end
end 
