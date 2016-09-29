class Workshop < ActiveRecord::Base
  belongs_to :location
  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations
end
