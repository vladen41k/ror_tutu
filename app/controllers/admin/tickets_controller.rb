module Admin
  class TicketsController < BaseController
    before_action :set_ticket, only: %i[show destroy edit]

    def index
      @tickets = Ticket.all
    end

    def show; end

    def edit; end

    def new
      @ticket = Ticket.new(ticket_params)
    end

    def update
      if @ticket.update(ticket_params)
        redirect_to admin_ticket_path(@ticket)
      else
        render :new
      end
    end

    def destroy
      @ticket.destroy
      redirect_to admin_tickets_path
      # redirect_to @tickets
    end

    private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:train_id,
                                     :start_station_id, :end_station_id,
                                     :middle_name_id, :first_name_id,
                                     :last_name_id, :passport_details_id)
    end
  end
end