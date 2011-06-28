class CallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :calls do |config|
    config.columns = [:calldate, :clid, :src, :dst]

    config.sti_children = [:outgoing_call,:incomming_call, :failed_call]

 #    config.columns[:outgoing_device].association.reverse = :call
#    config.columns[:incomming_device].association.reverse = :call
#    config.columns[:slugs].association.reverse = :product

  end
end 
