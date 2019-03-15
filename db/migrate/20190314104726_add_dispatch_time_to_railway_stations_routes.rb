class AddDispatchTimeToRailwayStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :railway_stations_routes, :dispatch_time, :timestamp
    add_column :railway_stations_routes, :arrival_time, :timestamp
  end
end
