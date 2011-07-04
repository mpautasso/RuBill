class OutgoingCall < ActiveRecord::Base
  belongs_to :device#, :foreign_key => 'exten', :inverse_of => :outgoing_calls
  belongs_to :invoice
  belongs_to :rate
  
  before_validation :rating, :on => :create

  scope :by_date, lambda {|date| where(:calldate => date)}

  validates :src, :dst, :presence => true
  validates_with CallValidator
  
  scope :by_user, lambda {|user| where(:user_id => user.id) }

  scope :created_since, lambda { |ago| where("outgoing_calls.calldate >= ?", ago) }
  scope :created_until, lambda { |ago| where("outgoing_calls.calldate <= ?", ago) }


  def rating
    rate = applied_rate
    self.cost = 0

    if rate
      if (self.billsec > 0) then
        intervals = ((self.billsec - rate.initial_time).to_f / rate.interval).ceil
        self.cost = rate.initial_cost + intervals * rate.interval_cost
      end
    end
  end

  def applied_rate
    rates = Rate.order('rates.prefix DESC')

    result = rates.select{|x| self.dst.start_with?(x.prefix)}

    result.empty? ? nil : result.first 
  end
end
