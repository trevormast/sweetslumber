class AddChargeTokenToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :charge_token, :string
  end
end
