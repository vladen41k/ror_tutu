module Admin
  class RoutesController < BaseController
    before_action :set_route, only: [:edit, :update, :destroy, :update_positions]

    def index
      @routes = Route.all
    end

    def show
      @route = Route.find(params[:id])
      @railway_stations_routes = RailwayStationsRoute.where(route_id: @route.id,
                                                            railway_station_id: @route.railway_stations.pluck(:id))
                                     .includes(:railway_station).order(:position)
    end


    def new
      @route = Route.new
    end

    def create
      @route = Route.new(route_params)

      if @route.save
        redirect_to admin_routes_path(@route)
      else
        render :new
      end
    end

    def edit; end

    def update_positions
      if valid_positions?
        RailwayStationsRoute.update(params['railway_stations_routes'].keys,
                                    params['railway_stations_routes'].values)
      else

      end
      redirect_to @route
    end

    def update
      if @route.update(route_params)
        redirect_to admin_routes_path(@route)
      else
        render :new
      end
    end

    def destroy
      @route.destroy
      redirect_to admin_routes_path
    end

    private

    def valid_positions?
      positions = params['railway_stations_routes'].values
      positions.map { |p| p[:position] }.uniq!.nil?
    end

    def set_route
      @route = Route.find(params[:id])
    end

    def route_params
      params.require(:route).permit(:name, railway_station_ids: [])
    end
  end
end