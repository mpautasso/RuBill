class Call < ActiveRecord::Base
#  has_many :items, :as => :reference
  belongs_to :invoice

end
