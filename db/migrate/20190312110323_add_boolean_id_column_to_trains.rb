class AddBooleanIdColumnToTrains < ActiveRecord::Migration[5.2]
  def change
    add_column :trains, :boolean_id, :boolean, default: false
  end
end
