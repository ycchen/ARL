class DashboardsController < ApplicationController
  
  def show
  	@myhandreciepts = current_user.inventory_records
  	@HandRecieptsCount = InventoryRecord.includes(:user, :inventory, :inventory_status).count(:group => :user_id)
  end

end
