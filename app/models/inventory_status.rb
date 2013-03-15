class InventoryStatus < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  has_many :inventory_records
end
