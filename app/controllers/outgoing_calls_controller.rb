class OutgoingCallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :outgoing_calls do |config|
    base_cols = [:clid, :src, :dst, :calldate, :duration]

    config.list.columns = base_cols

  end
  
  def conditions_for_collection 
    { :device_id => current_user.device.exten}     
  end 

end 
