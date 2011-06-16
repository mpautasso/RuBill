class Call < ActiveRecord::Base
  has_many :items, :as => :item
end
