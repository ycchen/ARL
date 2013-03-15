class InventoryRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :inventory
  belongs_to :inventory_status
  belongs_to :location
  attr_accessible :latitude, :longitude
  
end
