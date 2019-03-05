class Wagon < ApplicationRecord
  validates :wagon_type, presence: true
  belongs_to :train
  enum wagon_type: %i[coupe reserved_seat]
end