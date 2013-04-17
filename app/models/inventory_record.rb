class InventoryRecord < ActiveRecord::Base
  resourcify

  belongs_to :user #, :inverse_of => :inventory_records
  belongs_to :inventory #, :inverse_of => :inventory_records
  belongs_to :inventory_status #, :inverse_of => :inventory_records
  belongs_to :location #, :inverse_of => :inventory_records
  
  attr_accessible :user_id, :inventory_id, :inventory_status_id, :location_id, :inventory_ids
  # , :latitude, :longitude


  
  validates :user_id, :presence => true
  validates :inventory_id, :presence => true
  validates :inventory_status_id , :presence => true
  validates :location_id, :presence => true
  # validates :latitude, :presence => true
  # validates :longitude, :presence => true


  def self.search(search)
    if search
      find(:all, 
           :joins => [:user, :inventory, :location],
           :conditions =>
           ['users.display_name LIKE ? OR inventories.name LIKE ? OR locations.name LIKE ?',
            "%#{search}%","%#{search}%","%#{search}%"])
    else
      find(:all)
    end
  end
end
