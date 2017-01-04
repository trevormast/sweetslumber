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
                :amount => workshop_total_price,
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

  def add_plus_one_value(string)
    bool = string == "true" ? true : false
    self.plus_one = bool
  end

  def workshop_total_price
    plus_one == true ? workshop.price + workshop.plus_one_price : workshop.price
  end
end

# Stripe Response Example
# => #<Stripe::Charge:0x3fe90471a6d8 id=ch_19FtNuJfsZ7rJG63XE5kipHx> JSON: {
#   "id": "ch_19FtNuJfsZ7rJG63XE5kipHx",
#   "object": "charge",
#   "amount": 2000,
#   "amount_refunded": 0,
#   "application": null,
#   "application_fee": null,
#   "balance_transaction": "txn_19FtNuJfsZ7rJG63Yhyq3VwT",
#   "captured": true,
#   "created": 1479164226,
#   "currency": "usd",
#   "customer": null,
#   "description": "Charge for daniel.martinez@example.com",
#   "destination": null,
#   "dispute": null,
#   "failure_code": null,
#   "failure_message": null,
#   "fraud_details": {},
#   "invoice": null,
#   "livemode": false,
#   "metadata": {},
#   "order": null,
#   "outcome": {"network_status":"approved_by_network","reason":null,"risk_level":"normal","seller_message":"Payment complete.","type":"authorized"},
#   "paid": true,
#   "receipt_email": null,
#   "receipt_number": null,
#   "refunded": false,
#   "refunds": {"object":"list","data":[],"has_more":false,"total_count":0,"url":"/v1/charges/ch_19FtNuJfsZ7rJG63XE5kipHx/refunds"},
#   "review": null,
#   "shipping": null,
#   "source": {"id":"card_19DLaqJfsZ7rJG6395l71aSn","object":"card","address_city":null,"address_country":null,"address_line1":null,"address_line1_check":null,"address_line2":null,"address_state":null,"address_zip":null,"address_zip_check":null,"brand":"Visa","country":"US","customer":null,"cvc_check":null,"dynamic_last4":null,"exp_month":8,"exp_year":2017,"fingerprint":"yJx1F6N5uA9ITdrV","funding":"credit","last4":"4242","metadata":{},"name":null,"tokenization_method":null},
#   "source_transfer": null,
#   "statement_descriptor": null,
#   "status": "succeeded"
# }
