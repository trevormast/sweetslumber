class AddRegistrationToQuestionaire < ActiveRecord::Migration
  def change
    add_reference :questionaires, :registration, index: true, foreign_key: true
  end
end
