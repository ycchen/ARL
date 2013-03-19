class Location < ActiveRecord::Base

  resourcify

  

  attr_accessible :latitude, :longitude, :name, :address

acts_as_gmappable :latitude => 'latitude', :longitude => 'longitude', :process_geocoding => :geocode?,

:address => 'address', :normalized_address => 'address',:msg => "Sorry, not even Google could figure out where that is"

  # geocoded_by :address
  # after_validation :geocode

  validates :name, :presence => true
  validates :address, :presence => true
  # validates :latitude, :presence => true
  # validates :longitude, :presence => true

  def geocode?
  	(!address.blank? && (latitude.blank? || longitude.blank?)) || address_changed?
  end

  def gmaps4rails_address
	address  		
  end

  def gmaps4rails_infowindow
  	"<h4>#{name}</h4>" << "<h4>#{address}</h4>"
  end

end
