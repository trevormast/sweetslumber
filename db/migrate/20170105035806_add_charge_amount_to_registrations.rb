class AddChargeAmountToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :charge_amount, :integer
  end
end
