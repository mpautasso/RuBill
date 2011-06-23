class Item < ActiveRecord::Base
  belongs_to :invoice

  belongs_to :reference, :polymorphic => true
end
