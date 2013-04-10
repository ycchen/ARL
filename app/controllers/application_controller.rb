class ApplicationController < ActionController::Base
  protect_from_forgery

	rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
  
  rescue_from CanCan::AccessDenied do |exception|
    render_not_found(exception.message)
  end
  
  # helper_method :admin?

	def routing_error
		render_not_found('The object you tried to access does not exist!')
	end

  protected

  def render_not_found(msg='The object you tried to access does not exist!')
  	flash[:notice]= msg
  	redirect_to root_path
  end

  def isAdmin?
    unless current_user && current_user.admin?
        flash[:notice]= "You are not authorize to access this page!"
        redirect_to root_path
    end
  end
end
