class IncommingCall < ActiveRecord::Base
  belongs_to :device
  belongs_to :invoice
  
  scope :by_date, lambda {|date| where(:calldate => date)}
  
  validates_with CallValidator
end

