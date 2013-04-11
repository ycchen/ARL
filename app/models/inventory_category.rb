class InventoryCategory < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :category
  # attr_accessible :title, :body
end
