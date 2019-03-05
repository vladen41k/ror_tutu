class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :first_railway_station, class_name: 'RailwayStation', foreign_key: :first_railway_station_id, optional: true
  belongs_to :last_railway_station, class_name: 'RailwayStation', foreign_key: :last_railway_station_id, optional: true
  has_many :users
end
