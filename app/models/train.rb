class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key:
      :current_station_id, optional: true
  has_many :tickets
  has_many :wagons

  def boolean_sorted
    boolean_id ? wagons.order(number: :asc) : wagons.order(number: :desc)
  end
end