class CreateQuestionaires < ActiveRecord::Migration
  def change
    create_table :questionaires do |t|
      t.text :baby_name
      t.datetime :baby_dob
      t.string :nap_location
      t.string :night_location
      t.string :desired_sleep_location
      t.string :nap_routine
      t.string :night_routine
      t.integer :naps_per_day
      t.time :bedtime
      t.string :sleep_obstacle
      t.integer :nightwakings
      t.string :sleep_goal
      t.string :referred_by

      t.timestamps null: false
    end
  end
end
