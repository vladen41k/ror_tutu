class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(params)
    station_route = station_route(params[:route])
    station_route.update(position: params[:position],
                         dispatch_time: params[:dispatch_time], arrival_time: params[:arrival_time]) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def dispatch_t(route)
    station_route(route).try(:dispatch_time)
  end

  def arrival_t(route)
    station_route(route).try(:arrival_time)
  end

  def station_route(route)
    station_route ||= railway_stations_routes.where(route: route).first
  end
end
