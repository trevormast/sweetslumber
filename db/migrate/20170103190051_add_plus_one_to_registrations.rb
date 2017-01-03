class AddPlusOneToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :plus_one, :bool
  end
end
