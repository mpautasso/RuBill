class OutgoingCallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :outgoing_calls do |config|

  end
end 
