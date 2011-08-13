class CallsController < ApplicationController
  
  before_filter :authenticate
  
#  active_scaffold :calls do |config|
#    config.columns = [:calldate, :clid, :src, :dst]

#    config.sti_children = [:outgoing_call,:incomming_call, :failed_call]


#  end
end 
