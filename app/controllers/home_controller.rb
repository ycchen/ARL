class HomeController < ApplicationController
  
	def index
		
		# if current_user && current_user.admin?
		# 	@list = current_user.inventory_records.includes(:user, :inventory, :inventory_status, :location).order('created_at desc')
		# else
		# 	@list = InventoryRecord.includes(:user, :inventory, :inventory_status, :location).order('created_at desc')
		# end
		@list = InventoryRecord.includes(:user, :inventory, :inventory_status, :location).order('created_at desc')
	end

end
