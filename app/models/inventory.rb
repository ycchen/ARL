class Inventory < ActiveRecord::Base
  resourcify
	
  attr_accessible :barcode, :description, :name, :purchase_date, :stocknumber

  has_many :inventory_records
  has_many :locations, :through => :inventory_records


  validates :barcode, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :purchase_date, :presence => true

  scope :unregistered, where("id NOT IN (select inventory_id from inventory_records where inventory_records.inventory_id = inventories.id)")
  
  scope :registered,    Inventory.where("id IN (select inventory_id from inventory_records where inventory_records.inventory_id = inventories.id)")
  scope :checkedin,     Inventory.where("id IN (select inventory_id from inventory_records where inventory_records.inventory_id = inventories.id and inventory_status_id=2)")
  scope :checkedout,    Inventory.where("id IN (select inventory_id from inventory_records where inventory_records.inventory_id = inventories.id and inventory_status_id=3)")
  scope :missing,       Inventory.where("id IN (select inventory_id from inventory_records where inventory_records.inventory_id = inventories.id and inventory_status_id=4)")
  scope :deaccessioned, Inventory.where("id IN (select inventory_id from inventory_records where inventory_records.inventory_id = inventories.id and inventory_status_id=5)")

  # override the default "per_page" for kaminari pagination
  paginates_per 10
end
