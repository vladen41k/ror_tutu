class CoupeCarriage < Wagon
  validates :number, :top_seats, :bottom_seats, presence: true
  validates :seats, :side_top_seats,
            :side_bottom_seats, absence: true
end