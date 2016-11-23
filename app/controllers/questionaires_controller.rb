class QuestionairesController < ApplicationController
  before_action :admin_only


  def show
    @questionaire = Registration.find_by(user_id: params[:user_id],
                                         workshop_id: params[:workshop_id]).questionaire
  end

  # private
  #   def set_questionaire
  #     @questionaire = Questionaire.find(params[:id])
  #   end

  #   def questionaire_params
  #     params.require(:questionaire).permit(:baby_name, :baby_dob, :nap_location, :night_location, :desired_sleep_location, :nap_routine, :night_routine, :naps_per_day, :bedtime, :sleep_obstacle, :nightwakings, :sleep_goal, :referred_by)
  #   end
end
