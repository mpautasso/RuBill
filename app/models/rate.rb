class Rate < ActiveRecord::Base
  has_many :outgoing_calls

  def self.search(search)
    if search
      where('prefix LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
