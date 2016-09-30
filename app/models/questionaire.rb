class Questionaire < ActiveRecord::Base
  belongs_to :registration
  validates :baby_name, :baby_dob, :nap_location,
            :night_location, :desired_sleep_location,
            :nap_routine, :night_routine, :naps_per_day,
            :bedtime, :sleep_obstacle, :nightwakings,
            :sleep_goal, :referred_by, presence: true
end
