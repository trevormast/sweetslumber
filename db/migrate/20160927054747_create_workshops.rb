class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :type
      t.datetime :time
      t.integer :limit

      t.timestamps null: false
    end
  end
end
