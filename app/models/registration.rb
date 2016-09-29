class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :workshop
  has_one :questionaire, dependent: :destroy

end
