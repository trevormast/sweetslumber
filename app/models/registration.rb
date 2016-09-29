class Registration < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :workshop
  has_one :questionaire
end
