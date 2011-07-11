class IncommingCall < ActiveRecord::Base
  belongs_to :device, :primary_key => 'src', :foreign_key => 'exten', :inverse_of => :incomming_calls
  belongs_to :invoice
  
  validates :src, :presence => true
  
  scope :by_date, lambda {|date| where(:calldate => date)}
  
  validates_with CallValidator
  
  def self.search(search)
    if search
      where('dst LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
