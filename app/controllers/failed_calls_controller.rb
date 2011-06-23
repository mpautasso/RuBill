class FailedCallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :failed_calls do |conf|
       global_as_config(conf)
  end
end 
