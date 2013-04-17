require 'securerandom'

class HandReciept < ActiveRecord::Base
  belongs_to :user
  attr_accessible :reciept, :user_id

# scope :registered,    Inventory.where("id IN (select inventory_id from inventory_records where inventory_records.inventory_id = inventories.id)")

	def self.unique_reciept
		SecureRandom.hex(13)
	end

end
