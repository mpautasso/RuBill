class CallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :calls do |conf|
    conf.columns = [:calldate, :clid, :src, :dst]

    conf.sti_children = [:outgoing_call,:incomming_call, :failed_call]
  end
end 
