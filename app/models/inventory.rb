class Inventory < ActiveRecord::Base
  attr_accessible :barcode, :description, :name, :purchase_date, :stockenumber

  validates :barcode, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :purchase_date, :presence => true
end
