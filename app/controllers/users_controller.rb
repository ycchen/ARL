class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :isAdmin?
  def index
  	@users = User.all
  end
end
