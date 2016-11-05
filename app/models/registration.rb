class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :workshop
  has_one :questionaire, dependent: :destroy

  validates :user_id, uniqueness: { scope: :workshop_id, message: "Already Registered" }
  validates_presence_of :workshop_id
  # accepts_nested_attributes_for :questionaire
  validates_associated :questionaire
end
