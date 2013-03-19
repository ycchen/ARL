class RolesUser < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
  
  attr_accessible :role_id, :user_id
  
  validates :role_id, :presence => true
  validates :user_id, :presence => true
end
