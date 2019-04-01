class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :user

  after_create :send_notification
  after_destroy :send_notification_delete


  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_notification_delete
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end
