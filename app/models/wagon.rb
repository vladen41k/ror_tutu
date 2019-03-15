class Wagon < ApplicationRecord
  belongs_to :train
  # default_scope { order(:number) }

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :ordered, -> { order(:number) }
  scope :uniqueness, -> { where(number: true) }

  before_validation :set_number

  private


  def set_number
    last_number = Wagon.where(train_id: train_id).ordered.last.try(:number)
    self.number = last_number.present? ? last_number.next : 1
  end
end