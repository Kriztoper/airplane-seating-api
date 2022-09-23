class Array2dUtils

  def self.array_2D_print array
    puts "\n{"
    array.each do |arr|
      arr.each do |item|
        print "#{item} "
        print "\n"
      end
      print "\n"
    end
    puts "}"
  end

  def self.array_2D_print_formatted array
    array.each do |row|
      output = row.inject('') do |string, seat|
        seat_str = seat ? "#{seat.to_s.ljust(3)} " : ' '.ljust(4)
        string + seat_str
      end

      puts output
    end
  end

end
