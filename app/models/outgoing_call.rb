class OutgoingCall < ActiveRecord::Base
  belongs_to :device
  belongs_to :invoice
  
  scope :by_date, lambda {|date| where(:calldate => date)}

  validates :src, :dst, :presence => true
  validates_with CallValidator
  
#  scope :by_user, lambda {|user| where(:user_id => user.id) }


end
