class SearchesController < ApplicationController
  def show
    if params[:start_station_id] != params[:end_station_id]
      start_station = Train.joins(route: :railway_stations).where("railway_station_id = ?", params[:start_station_id])
      end_station = Train.joins(route: :railway_stations).where("railway_station_id = ?", params[:end_station_id])
      @trains = start_station & end_station
    else
      flash[:error] = 'Выбранны одинаковые станции'
    end
  end
end