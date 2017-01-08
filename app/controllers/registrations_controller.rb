class RegistrationsController < ApplicationController
  before_action :one_week_prior?, only: [:create]

  def new
    @workshop = Workshop.find(params[:workshop_id])

    @registration = Registration.new(workshop_id: @workshop,
                                     user_id: current_user)
  end

  def create
    @registration = Registration.new(workshop_id: params[:workshop_id],
                                     user_id: current_user.id)

    @registration.add_questionaire(registration_params[:questionaire])
    @registration.add_plus_one_value(params['registration']['plus_one'])

    respond_to do |format|
      if @registration.save_with_payment(params['registration']['stripe_card_token'])

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

    def one_week_prior?
      @workshop = Workshop.find(params[:workshop_id])
      @workshop.time >= 7.days.from_now ? true : redirect_to(workshops_path, alert: "You must register one week prior to workshop date.")
    end

end
