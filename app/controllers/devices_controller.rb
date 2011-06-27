class DevicesController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :device do |conf|
     global_as_config(conf)
  end
end 
