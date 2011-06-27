class FailedCallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :failed_calls do |config|
    config.label = "Failed Call ..."
  end
end 
