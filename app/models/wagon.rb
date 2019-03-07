class Wagon < ApplicationRecord
  validates :number, :top_seats, :bottom_seats, presence: true
  belongs_to :train
  # default_scope { order(:number) }

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :ordered, -> { order(:number) }
end