class AddLocationToWorkshop < ActiveRecord::Migration
  def change
    add_reference :workshops, :location, index: true, foreign_key: true
  end
end
