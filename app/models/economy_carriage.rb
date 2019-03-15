class EconomyCarriage < Wagon
  validates :number, :top_seats, :bottom_seats, :side_top_seats,
            :side_bottom_seats, presence: true
  validates :seats, absence: true
end