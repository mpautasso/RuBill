class IncommingCallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :incomming_calls do |config|
    base_cols = [:calldate, :src, :dst, :duration, :billsec]
    config.list.columns = base_cols

    config.label = "Incomming Calls"
  end
end 
