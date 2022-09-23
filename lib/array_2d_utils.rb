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

end
