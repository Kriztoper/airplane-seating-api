class AssignSeatService

  def assign(dimensions, num_passengers)
    seats = init_seats dimensions

    group_size = seats.size
    puts "group size: #{group_size}"
    @max_row_index = 0

    passenger_count = 1
    group_number = 1
    aisle_seats = []
    window_seats = []
    center_seats = []
    seats.each do |group|
      puts "\ngroup #{group_number}: #{group}"

      group.each_with_index do |row, row_index|
        puts "row before: #{row}"

        if row_index > @max_row_index
          @max_row_index = row_index
        end

        row.each_with_index do |seat, col_index|

          puts "row_index: #{row_index}, col_index: #{col_index}"
          puts "is_aisle_seat: #{is_aisle_seat(col_index, group, group_number, group_size)}"
          puts "is_window_seat: #{is_window_seat(col_index, group, group_number, group_size)}"
          if is_aisle_seat(col_index, group, group_number, group_size)
            seat = Seat.new group: group_number, x: row_index, y: col_index, airplane_id: 1
            aisle_seats.append seat
          elsif is_window_seat(col_index, group, group_number, group_size)
            seat = Seat.new group: group_number, x: row_index, y: col_index, airplane_id: 1
            window_seats.append seat
          else
            seat = Seat.new group: group_number, x: row_index, y: col_index, airplane_id: 1
            center_seats.append seat
          end
          passenger_count += 1
        end
        puts "row after: #{row}"
      end
      group_number += 1
    end

    assign_passengers_to_all_grouped_seats(aisle_seats, center_seats, num_passengers, seats, window_seats)
  end

  def is_aisle_seat(col_index, current_group, group_number, group_size)
    last_col_index = current_group[0].size - 1

    is_first_column = col_index == 0
    is_last_column = col_index == last_col_index

    is_first_group = group_number == 1
    is_last_group = group_number == group_size

    # if is aisle seat of 1st group
    if is_first_group
      return is_last_column
    end

    # if is aisle seat of last group
    if is_last_group
      return is_first_column
    end

    # if is aisle seat of middle groups
    if is_first_column or is_last_column
      return true
    end

    false
  end

  def is_window_seat(col_index, current_group, group_number, group_size)
    last_col_index = current_group[0].size - 1

    # if is window seat of 1st group
    is_first_group = group_number == 1
    if is_first_group
      is_first_column = col_index == 0
      return is_first_column
    end

    # if is window seat of last group
    is_last_group = group_number == group_size
    if is_last_group
      is_last_column = col_index == last_col_index
      return is_last_column
    end

    false
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

  private

  def assign_passengers_to_all_grouped_seats(aisle_seats, center_seats, num_passengers, seats, window_seats)
    passenger_count = 1

    aisle_seats = aisle_seats.sort_by { |a| [a.x, a.group, a.y] }
    passenger_count = assign_passengers_to_grouped_seats(aisle_seats, num_passengers, passenger_count, seats)

    window_seats = window_seats.sort_by { |w| [w.x, w.group, w.y] }
    passenger_count = assign_passengers_to_grouped_seats(window_seats, num_passengers, passenger_count, seats)

    center_seats = center_seats.sort_by { |c| [c.x, c.group, c.y] }
    assign_passengers_to_grouped_seats(center_seats, num_passengers, passenger_count, seats)

    seats
  end

  def assign_passengers_to_grouped_seats(grouped_seats, num_passengers, passenger_count, seats)
    grouped_seats.each do |seat|

      if passenger_count > num_passengers
        break;
      end

      print seat
      seats[seat.group - 1][seat.x][seat.y] = passenger_count
      seat.passenger_num = passenger_count
      passenger_count += 1
    end

    passenger_count
  end

end
