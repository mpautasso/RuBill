# == Schema Information
#
# Table name: outgoing_calls
#
#  id          :integer(4)      not null, primary key
#  calldate    :datetime
#  clid        :string(80)      default("")
#  src         :string(80)      default("")
#  dst         :string(80)      default("")
#  dcontext    :string(80)      default("")
#  channel     :string(80)      default("")
#  dstchannel  :string(80)      default("")
#  lastapp     :string(80)      default("")
#  lastdata    :string(80)      default("")
#  duration    :integer(4)      default(0)
#  billsec     :integer(4)      default(0)
#  disposition :string(45)      default("")
#  amaflags    :integer(4)      default(0)
#  accountcode :string(20)      default("")
#  userfield   :string(255)     default("")
#  created_at  :datetime
#  updated_at  :datetime
#  cost        :decimal(6, 2)   default(0.0), not null
#  invoice_id  :integer(4)
#  rate_id     :integer(4)
#

class OutgoingCall < ActiveRecord::Base
  belongs_to :device, :foreign_key => 'src', :primary_key => 'exten', :inverse_of => :outgoing_calls
  belongs_to :invoice      
  belongs_to :rate
  
  before_validation :rating

  scope :by_date, lambda {|date| where(:calldate => date)}

  validates :src, :dst, :calldate, :presence => true
  validates_numericality_of :cost, :duration, :billsec, :greater_than_or_equal_to => 0
  validates_with CallValidator, :on => :create

  scope :by_user, lambda {|user| where(:user_id => user.id) }

  scope :created_since, lambda { |ago| where("outgoing_calls.calldate >= ?", ago) }
  scope :created_until, lambda { |ago| where("outgoing_calls.calldate <= ?", ago) }


  def rating
    rate = applied_rate
    self.cost = 0

    if rate
      if (self.billsec > 0) then
        intervals = ((self.billsec - rate.initial_time).to_f / rate.interval_time).ceil
        self.cost = rate.initial_cost + intervals * rate.interval_cost
      end
    end
  end

  def applied_rate
    rates = Rate.order('rates.prefix DESC')

    result = rates.select{|x| self.dst.start_with?(x.prefix)}

    result.empty? ? nil : result.first 
  end

  def self.search(search)
    if search
      where('dst LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
