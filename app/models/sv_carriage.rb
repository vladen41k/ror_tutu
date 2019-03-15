class SvCarriage < Wagon
  validates :number, :bottom_seats, presence: true
  validates :top_seats, :seats, :side_top_seats, :side_bottom_seats,
            absence: true
end