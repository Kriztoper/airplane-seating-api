# frozen_string_literal: true

require 'test_helper'

class AssignSeatServiceTest < ActiveSupport::TestCase
  test '1 group of seats with 1 column and 2 rows' do
    puts "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Test class: #{self.class.name}"
    puts "Test method: #{self.method_name}"

    dimensions = [[1,2]]
    service = AssignSeatService.new
    seats = service.init_seats dimensions
    only_group = seats[0]

    print "\ninit seats for [[1,2]]:"
    Array2dUtils.array_2D_print seats

    assert_equal 2, only_group.length
    assert_equal 1, only_group[0].length
    assert_equal 1, only_group[1].length
  end

  test '1 group of seats with 2 columns and 2 rows' do
    puts "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Test class: #{self.class.name}"
    puts "Test method: #{self.method_name}"

    dimensions = [[2,2]]
    service = AssignSeatService.new
    seats = service.init_seats dimensions
    only_group = seats[0]

    print "\ninit seats for [[2,2]]:"
    Array2dUtils.array_2D_print seats

    assert_equal 2, only_group.length
    assert_equal 2, only_group[0].length
    assert_equal 2, only_group[1].length
  end

  test '2 groups of seats with 1 column and 2 rows' do
    puts "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Test class: #{self.class.name}"
    puts "Test method: #{self.method_name}"

    dimensions = [[1,2], [1,2]]
    service = AssignSeatService.new
    seats = service.init_seats dimensions

    print "\ninit seats for [[1,2], [1,2]]:"
    Array2dUtils.array_2D_print seats

    group1 = seats[0]
    assert_equal 2, group1.length
    assert_equal 1, group1[0].length
    assert_equal 1, group1[1].length

    group2 = seats[1]
    assert_equal 2, group2.length
    assert_equal 1, group2[0].length
    assert_equal 1, group2[1].length
  end

  test '2 groups of seats with 2 columns and 2 rows' do
    puts "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Test class: #{self.class.name}"
    puts "Test method: #{self.method_name}"

    dimensions = [[2,2], [2,2]]
    service = AssignSeatService.new
    seats = service.init_seats dimensions

    print "\ninit seats for [[2,2], [2,2]]:"
    Array2dUtils.array_2D_print seats

    group1 = seats[0]
    assert_equal 2, group1.length
    assert_equal 2, group1[0].length
    assert_equal 2, group1[1].length

    group2 = seats[1]
    assert_equal 2, group2.length
    assert_equal 2, group2[0].length
    assert_equal 2, group2[1].length
  end

  test '[[3,2], [4,3], [2,3], [3,4]]' do
    puts "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Test class: #{self.class.name}"
    puts "Test method: #{self.method_name}"

    dimensions = [[3,2], [4,3], [2,3], [3,4]]
    service = AssignSeatService.new
    seats = service.init_seats dimensions

    print "\ninit seats for [[3,2], [4,3], [2,3], [3,4]]:"
    Array2dUtils.array_2D_print seats

    group1 = seats[0]
    assert_equal 2, group1.length
    assert_equal 3, group1[0].length
    assert_equal 3, group1[1].length

    group2 = seats[1]
    assert_equal 3, group2.length
    assert_equal 4, group2[0].length
    assert_equal 4, group2[1].length
    assert_equal 4, group2[1].length

    group3 = seats[2]
    assert_equal 3, group3.length
    assert_equal 2, group3[0].length
    assert_equal 2, group3[1].length
    assert_equal 2, group3[2].length

    group4 = seats[3]
    assert_equal 4, group4.length
    assert_equal 3, group4[0].length
    assert_equal 3, group4[1].length
    assert_equal 3, group4[2].length
    assert_equal 3, group4[3].length
  end

  test 'assign passengers to seats [[3,6], [4,3]]' do
    puts "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Test class: #{self.class.name}"
    puts "Test method: #{self.method_name}"

    dimensions = [[3,6], [4,3]]
    service = AssignSeatService.new
    seats = service.assign dimensions, 6

    print "\nresult of init seats for [[3,6], [4,3]]:"
    Array2dUtils.array_2D_print seats

    expected_seating_arrangement = [
      [[0, 0, 1],
       [0, 0, 3],
       [0, 0, 5],
       [0, 0, 0],
       [0, 0, 0],
       [0, 0, 0]],

      [[2, 0, 0, 0],
       [4, 0, 0, 0],
       [6, 0, 0, 0]]
    ]

    assert_equal expected_seating_arrangement, seats

  end

  test 'assign passengers to seats [[3,2], [4,3], [2,3], [3,4]]' do
    puts "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Test class: #{self.class.name}"
    puts "Test method: #{self.method_name}"

    dimensions = [[3,2], [4,3], [2,3], [3,4]]
    service = AssignSeatService.new
    seats = service.assign dimensions, 30

    print "\nresult of init seats for [[3,2], [4,3], [2,3], [3,4]]:"
    Array2dUtils.array_2D_print seats

    expected_seating_arrangement = [
      [[19, 25, 1],
       [21, 29, 7]],

      [[2, 26, 27, 3],
       [8, 30, 0, 9],
       [13, 0, 0, 14]],

      [[4, 5],
       [10, 11],
       [15, 16]],

      [[6, 28, 20],
       [12, 0, 22],
       [17, 0, 23],
       [18, 0, 24]]
    ]

    assert_equal expected_seating_arrangement, seats

  end

end

