class DevicesController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :devices do |config|
#    config.nested.add_link(:outgoing_calls)

#   base_cols = [:exten]
#   config.list.columns = base_cols + [:created_at]
#   config.create.columns = base_cols

  end
end 
