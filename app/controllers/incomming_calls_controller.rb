class IncommingCallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :incomming_calls do |conf|
       global_as_config(conf)
  end
end 
