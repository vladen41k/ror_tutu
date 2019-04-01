module Admin
  class WagonsController < BaseController
    before_action :set_train
    before_action :set_wagon, only: [ :show, :edit, :update, :destroy ]

    def index
      @wagons = Wagon.all
    end

    def show; end

    def new
      @wagon = @train.wagons.new
    end

    def create
      @wagon = @train.wagons.new(wagon_params)

      if @wagon.save
        redirect_to admin_train_wagons_url(@train.id)
      else
        render :new
      end
    end

    def edit; end

    def update
      if @wagon.update(wagon_params)
        redirect_to admin_train_wagons_url(@train.id)
      else
        render :edit
      end
    end

    def destroy
      @wagon.destroy
      redirect_to admin_train_wagons_url(@train.id)
    end

    private

    def set_wagon
      @wagon = Wagon.find(params[:id])
    end

    def set_train
      @train = Train.find(params[:train_id])
    end

    def wagon_params
      params.require(:wagon).permit(:type, :train_id, :seats, :side_bottom_seats,
                                    :side_top_seats, :bottom_seats, :top_seats)
    end
  end
end