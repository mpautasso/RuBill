class DevicesController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :devices do |conf|
    
  end
end 
