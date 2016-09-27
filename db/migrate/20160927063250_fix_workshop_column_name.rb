class FixWorkshopColumnName < ActiveRecord::Migration
  def change
    rename_column :workshops, :type, :subject
  end
end
