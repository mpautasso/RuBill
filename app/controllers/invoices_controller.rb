class InvoicesController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :invoice do |conf|
  end
end 
