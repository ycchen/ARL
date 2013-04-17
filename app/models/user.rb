class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :display_name
  # attr_accessible :title, :body
	
	validates :email, :presence => true
	validates :password, :presence => true
	validates :password_confirmation, :presence => true
	validates :display_name, :presence => true

  has_many :inventory_records
  has_many :inventories, :through => :inventory_records				
  has_one  :hand_reciept
# override the default "per_page" for kaminari pagination
  paginates_per 5

	def avatar
		Gravatar.new(self.email).image_url
	end

  def admin?
    has_role?(:admin)
  end

  def user?
    has_role?(:user) || admin?
  end

end
