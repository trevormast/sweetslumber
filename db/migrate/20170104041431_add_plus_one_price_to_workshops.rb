class AddPlusOnePriceToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :plus_one_price, :integer
  end
end
