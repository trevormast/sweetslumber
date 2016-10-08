# subject: string
# time: datetime
# limit: integer

class Workshop < ActiveRecord::Base
  belongs_to :location
  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations

  validates_presence_of :subject, :time, :limit, :location

end
