class InventoryStatus < ActiveRecord::Base
  resourcify
  
  attr_accessible :name

  validates :name, :presence => true

  has_many :inventory_records
end
