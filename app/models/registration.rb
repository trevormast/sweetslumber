class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :workshop
  has_one :questionaire, dependent: :destroy

  validates :user_id, uniqueness: { scope: :workshop_id, message: "Already Registered" }
  validates_presence_of :workshop_id
  validates_associated :questionaire

  attr_accessor :stripe_card_token

  def save_with_payment(token)
    if valid?
      charge = Stripe::Charge.create(
                :amount => workshop.price,
                :currency => "usd",
                :source => token, # obtained with Stripe.js
                :description => "Charge for Sweet Slumber Workshop",
                :receipt_email => User.find(user_id).email,
                :statement_descriptor => 'sweet slumber workshop'
              )

      self.charge_token = charge.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating charge: #{e.message}"
    errors.add :base, "There was a problem with your credit card: #{e.message}"
    false
  rescue Stripe::CardError => e
    logger.error "Stripe error while creating charge: #{e.message}"
    errors.add :base, "There was a problem with your credit card: #{e.message}"
    false
  end

  def add_questionaire(questionaire_params)
    questionaire = Questionaire.new(questionaire_params)
    self.questionaire = questionaire
  end
end
