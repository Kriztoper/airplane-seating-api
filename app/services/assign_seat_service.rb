class AssignSeatService

  def assign(dimensions, num_passengers)
    init_seats dimensions
    # passenger_count = 1
    # seats.each do |group|
    #   group.each do |group|
    #     group = passenger_count
    #     passenger_count += 1
    #   end
    # end
  end

  def init_seats(dimensions)
    seats = []
    dimensions.each do |d|
      width = d.first
      height = d.last
      group = Array.new(height) { Array.new(width) { 0 } }
      seats.push group
    end
    seats
  end

end
