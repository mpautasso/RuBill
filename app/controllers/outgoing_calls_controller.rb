class OutgoingCallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :outgoing_calls do |config|
    config.frontend = :shiny_new_frontend
    config.theme = :blue
    config.columns[:duration].calculate = :sum
    config.columns[:billsec].calculate = :sum


    config.label = "Outgoing Calls"
    
    base_cols = [:calldate, :src, :dst, :duration, :billsec]
    config.list.columns = base_cols
    
    columns[:calldate].label = "Call date"
    columns[:src].label = "From"
    columns[:dst].label = "To"
    columns[:duration].label = "Call duration"
    columns[:billsec].label = "Bill duration"
    #list.sorting = {:calldate => 'ASC'} 
    

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
