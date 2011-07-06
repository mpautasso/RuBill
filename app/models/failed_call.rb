class FailedCall < ActiveRecord::Base
  belongs_to :device
  belongs_to :invoice
  
  validates :src, :presence => true

  def self.search(search)
    if search
      where('dst LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

 
end
