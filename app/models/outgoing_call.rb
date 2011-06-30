class OutgoingCall < ActiveRecord::Base
  belongs_to :device, :foreign_key => 'exten', :inverse_of => :outgoing_calls
  belongs_to :invoice
  
  scope :by_date, lambda {|date| where(:calldate => date)}

  validates :src, :dst, :presence => true
  validates_with CallValidator
  
  scope :by_user, lambda {|user| where(:user_id => user.id) }

  scope :created_since, lambda { |ago| where("outgoing_calls.created_at >= ?", ago) }
  scope :created_until, lambda { |ago| where("outgoing_calls.created_at <= ?", ago) }

end
