class SeatsCarriage < Wagon
  validates :number, :seats, presence: true
  validates :top_seats, :bottom_seats, :side_top_seats,
            :side_bottom_seats, absence: true
end