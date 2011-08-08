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
#  total      :decimal(6, 2)   default(0.0), not null
#

class Invoice < ActiveRecord::Base
  belongs_to :user

  has_many :outgoing_calls
  has_many :incomming_calls
  has_many :failed_calls
  
  before_save :calculate_total

  validates :user, :from, :to, :presence => true

  def populate
    if user.admin?
      @calls = OutgoingCall.created_since(from).created_until(to)
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

  private

    def calculate_total
      self.total = total_invoice
    end
      
    def total_invoice
      outgoing_calls.inject(0.0){|sum, i| i.cost + sum }
    end
end
