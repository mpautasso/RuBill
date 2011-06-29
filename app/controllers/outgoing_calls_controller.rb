class OutgoingCallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :outgoing_calls do |config|
    base_cols = [:clid, :src, :dst, :calldate, :duration]

    config.list.columns = base_cols

  end
  
  # Show only current user outgoing calls
  def conditions_for_collection
   return_hash = { :device_id => nil }

   if !current_user.admin?
      if current_user.device && current_user.device.exten
        return_hash[:device_id] = current_user.device.exten
      end
   else
     return_hash = { }
   end
   return_hash
  end 

end 
