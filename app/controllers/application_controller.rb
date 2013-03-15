class ApplicationController < ActionController::Base
  protect_from_forgery

	rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found

	def routing_error
		render_not_found
	end

  protected

  def render_not_found
  	flash[:notice]= 'The object you tried to access does not exist!'
  	redirect_to root_path
  end
end
