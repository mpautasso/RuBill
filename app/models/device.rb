class Device < ActiveRecord::Base
  belongs_to :user

  has_many :outgoing_calls#, :primary_key => :exten
  has_many :incomming_calls
  has_many :failed_calls

  def to_s
    exten
  end

  def self.search(search)
    if search
      where('exten LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
