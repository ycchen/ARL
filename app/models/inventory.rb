class Inventory < ActiveRecord::Base
  resourcify
	
  attr_accessible :barcode, :description, :name, :purchase_date, :stocknumber

  has_many :inventory_records

  validates :barcode, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :purchase_date, :presence => true

  scope :unregistered, where("id NOT IN (select inventory_id from inventory_records where inventory_records.inventory_id = inventories.id)")
end
