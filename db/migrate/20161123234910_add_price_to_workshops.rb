class AddPriceToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :price, :integer
  end
end
