class Category < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :inventory_categorys
  has_many :inventories, :through => :inventory_categorys

  validates :name, :presence => true
  validates :description, :presence => true
  
end
