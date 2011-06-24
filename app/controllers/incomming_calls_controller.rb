class IncommingCallsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :incomming_calls do |conf|
  end
end 
