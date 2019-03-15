class CreateStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :railway_stations_routes do |t|
      t.integer :railway_station_id
      t.integer :route_id
      t.integer :position
    end
  end
end
