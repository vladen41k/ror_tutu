class AddChangeStation < ActiveRecord::Migration[5.2]
  def change
    rename_column :tickets, :first_railway_station_id, :start_station_id
    rename_column :tickets, :last_railway_station_id, :end_station_id
    rename_column :tickets, :patronymic_id, :middle_name_id
  end
end
