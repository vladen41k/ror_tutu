class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show destroy]

  def index
    @tickets = current_user.tickets.all
    # @tickets = Ticket.all
  end

  def show; end

  def new
    @ticket = Ticket.new(ticket_params)
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
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