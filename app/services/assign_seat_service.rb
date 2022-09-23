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

  def is_aisle_seat(col_index, current_group, group_number)
    last_col_index = current_group[0].size - 1

    # if is aisle seat of 1st group
    if group_number == 1
      if col_index == last_col_index
        return true
      else
        return false
      end
    end

    # if is aisle seat of last group
    if group_number == @group_size
      if col_index == 0
        return true
      else
        return false
      end
    end

    # if is aisle seat of middle groups
    if col_index == 0 or col_index == current_group[0].size - 1
      return true
    end

    false
  end

  def is_window_seat(col_index, current_group, group_number)
    last_col_index = current_group[0].size - 1

    # if is window seat of 1st group
    if group_number == 1
      if col_index == 0
        return true
      else
        return false
      end
    end

    # if is aisle seat of last group
    if group_number == @group_size
      if col_index == last_col_index
        return true
      else
        return false
      end
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

end
