class CategoriesInventory < ActiveRecord::Base
  belongs_to :category
  belongs_to :inventory
  # attr_accessible :title, :body
end
