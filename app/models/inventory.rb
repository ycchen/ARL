class Inventory < ActiveRecord::Base
  resourcify
	
  attr_accessible :barcode, :description, :name, :purchase_date, :stocknumber

  validates :barcode, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :purchase_date, :presence => true
end
