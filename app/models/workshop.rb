# subject: string
# time: datetime
# limit: integer

class Workshop < ActiveRecord::Base
  belongs_to :location
  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations

  scope :sorted_by_time, -> { order(time: :asc) }
  scope :upcoming, -> { where("time > ?", DateTime.now).sorted_by_time }

  validates_presence_of :subject, :time, :limit, :location, :price, :plus_one_price
  validates_numericality_of :price

end
