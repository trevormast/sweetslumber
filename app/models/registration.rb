class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :workshop
  has_one :questionaire, dependent: :destroy

  validates :user_id, uniqueness: { scope: :workshop_id, message: "Already Registered" }
end
