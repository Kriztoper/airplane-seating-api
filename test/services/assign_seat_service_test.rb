# frozen_string_literal: true

require 'test_helper'

class AssignSeatServiceTest < ActiveSupport::TestCase
  test '1 group of seats with 1 column and 2 rows' do
    dimensions = [[1,2]]
    service = AssignSeatService.new
    seats = service.init_seats dimensions
    only_group = seats[0]

    puts "created seats: #{seats}"

    assert_equal 2, only_group.length
    assert_equal 1, only_group[0].length
    assert_equal 1, only_group[1].length
  end

  test '1 group of seats with 2 columns and 2 rows' do
    dimensions = [[2,2]]
    service = AssignSeatService.new
    seats = service.init_seats dimensions
    only_group = seats[0]

    puts "created seats: #{seats}"

    assert_equal 2, only_group.length
    assert_equal 2, only_group[0].length
    assert_equal 2, only_group[1].length
  end

  test '2 groups of seats with 1 column and 2 rows' do
    dimensions = [[1,2], [1,2]]
    service = AssignSeatService.new
    seats = service.init_seats dimensions

    puts "created seats: #{seats}"

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
    dimensions = [[2,2], [2,2]]
    service = AssignSeatService.new
    seats = service.init_seats dimensions

    puts "created seats: #{seats}"

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
    dimensions = [[3,2], [4,3], [2,3], [3,4]]
    service = AssignSeatService.new
    seats = service.init_seats dimensions

    puts "created seats: #{seats}"

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

end

