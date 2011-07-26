class ConsultsController < ApplicationController

  def index    
  end

  def filter_calls  
    @from = params[:invoice][:from]
    @to = params[:invoice][:to]

    if current_user.admin?
      @calls = OutgoingCall.created_since(@from)
    else
      if current_user.device
        @calls = OutgoingCall.created_since(@from).created_until(@to).select{|x| x.src == current_user.device.exten}
      else
        @calls = []
      end
    end

    respond_to do |format|
      format.js
    end
  end
end
