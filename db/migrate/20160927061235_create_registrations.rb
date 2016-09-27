class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :workshop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
