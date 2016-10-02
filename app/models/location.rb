class Location < ActiveRecord::Base
  has_many :workshops
  validates_presence_of :name, :address
end
