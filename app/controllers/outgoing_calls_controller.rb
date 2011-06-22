class OutgoingCallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :outgoing_calls do |conf|
    global_as_config(conf) 
  end
end 
