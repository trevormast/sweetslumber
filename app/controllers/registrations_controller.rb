class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all
  end

  def show
    @registration = Registration.find(params[:id])
  end

  def new
    @workshop = Workshop.find(params[:workshop_id])
  #   @registration = @workshop.registrations.build
    # @questionaire = @registration.build_questionaire

    @registration = Registration.new(workshop_id: @workshop,
                                     user_id: current_user)
  end

  def create
    @questionaire = Questionaire.new(questionaire_params[:questionaire])

    @registration = Registration.new(workshop_id: params[:workshop_id],
                                      user_id: current_user.id)
    @registration.questionaire = @questionaire

    respond_to do |format|
      if @registration.save
          format.html { redirect_to workshop_path(params[:workshop_id]), notice: 'Registration was successful.' }
          format.json { render :show, status: :created, location: @registration }
        else
          format.html { render :new }
          format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def questionaire_params
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
