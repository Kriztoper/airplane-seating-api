# frozen_string_literal: true

require 'test_helper'

class AssignSeatServiceTest < ActiveSupport::TestCase
  test '1 group of seats with 1 column and 2 rows' do
    dimensions = [[1,2]]
    service = AssignSeatService.new
    seats = service.init_seats dimensions
    only_group = seats[0]
    assert_equal 2, only_group.length
    assert_equal 1, only_group[0].length
    assert_equal 1, only_group[1].length
  end
end

