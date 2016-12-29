class RegistrationsController < ApplicationController
  def new
    @workshop = Workshop.find(params[:workshop_id])

    @registration = Registration.new(workshop_id: @workshop,
                                     user_id: current_user)
  end

  def create

    @registration = Registration.new(workshop_id: params[:workshop_id],
                                      user_id: current_user.id)
    @registration.add_questionaire(registration_params[:questionaire])

    @stripe_card_token = params['registration']['stripe_card_token']

    respond_to do |format|
      if @registration.save_with_payment(@stripe_card_token)

          RegistrationMailer.send_homework(@registration).deliver_later

          format.html { redirect_to root_path, notice: 'Registration was successful.' }
          format.json { render :show, status: :created, location: @registration }
        else
          format.html { redirect_to new_workshop_registration_path(params[:workshop_id]), alert: @registration.errors.full_messages.to_sentence }
          format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def registration_params
      params.require(:registration).permit(questionaire:
                                            [:baby_name,
                                            :baby_dob,
                                            :nap_location,
                                            :night_location,
                                            :desired_sleep_location,
                                            :nap_routine,
                                            :night_routine,
                                            :naps_per_day,
                                            :bedtime,
                                            :sleep_obstacle,
                                            :nightwakings,
                                            :sleep_goal,
                                            :referred_by])
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
