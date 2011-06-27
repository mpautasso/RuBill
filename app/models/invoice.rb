class Invoice < ActiveRecord::Base
  belongs_to :user
  has_many :calls


  def total
    items.map(&:cost).sum
  end
end
