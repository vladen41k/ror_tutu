module Admin
  class RailwayStationsController < BaseController
    before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position]

    # GET /railway_stations
    # GET /railway_stations.json
    def index
      @railway_stations = RailwayStation.all
    end

    # GET /railway_stations/1
    # GET /railway_stations/1.json
    def show
    end

    # GET /railway_stations/new
    def new
      @railway_station = RailwayStation.new
    end

    # GET /railway_stations/1/edit
    def edit
    end

    # POST /railway_stations
    # POST /railway_stations.json
    def create
      @railway_station = RailwayStation.new(railway_station_params)

      respond_to do |format|
        if @railway_station.save
          format.html { redirect_to admin_railway_station_path(@railway_station), notice: 'Railway station was successfully created.' }
          format.json { render :show, status: :created, location: @railway_station }
        else
          format.html { render :new }
          format.json { render json: @railway_station.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @railway_station.update(railway_station_params)
    end

    def update_position
      @route = Route.find(params[:route_id])
      @railway_station.update_position(update_params.to_h.symbolize_keys)
      redirect_to admin_route_path(@route)
    end

    # DELETE /railway_stations/1
    # DELETE /railway_stations/1.json
    def destroy
      @railway_station.destroy
      respond_to do |format|
        format.html { redirect_to admin_railway_stations_path, notice: 'Railway station was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def update_params
      params.permit(:position, :arrival_time, :dispatch_time).merge(route: @route)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
  end

end