class ContactMessage
  include ActiveModel::Model
  attr_accessor :email, :message
  validates :email, presence: true

end
