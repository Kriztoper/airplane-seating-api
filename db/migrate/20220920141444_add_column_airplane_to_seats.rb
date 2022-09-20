class AddColumnAirplaneToSeats < ActiveRecord::Migration[6.1]
  def change
    add_reference :seats, :airplane, null: false, foreign_key: true
  end
end
