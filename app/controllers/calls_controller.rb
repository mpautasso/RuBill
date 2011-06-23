class CallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :calls do |conf|
    global_as_config(conf)

    conf.columns = [:calldate, :clid, :src, :dst]

    conf.sti_children = [:outgoing_call,:incomming_call, :failed_call]
  end
end 
