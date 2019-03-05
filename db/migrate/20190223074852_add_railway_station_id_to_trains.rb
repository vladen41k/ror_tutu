class AddRailwayStationIdToTrains < ActiveRecord::Migration[5.2]
  def change
    # add_column :trains, :railway_station_id, :integer
    add_reference :trains, :current_station
  end
end
