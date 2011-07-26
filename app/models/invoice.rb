# == Schema Information
#
# Table name: invoices
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  from       :datetime
#  to         :datetime
#

class Invoice < ActiveRecord::Base
  belongs_to :user

  has_many :outgoing_calls
  has_many :incomming_calls
  has_many :failed_calls


  def populate
    if user.admin?
      @calls = OutgoingCall.created_since(from)
    else
      if user.device
        @calls = OutgoingCall.created_since(from).created_until(to).select{|x| x.src == user.device.exten}
      else
        @calls = []
      end
    end

    @calls.each do |call|
      self.outgoing_calls << call
    end
  end


  def total
    outgoing_calls.inject(0.0){|sum, i| i.cost + sum }
  end
end
