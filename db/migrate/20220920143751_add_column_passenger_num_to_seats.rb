class AddColumnPassengerNumToSeats < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :passenger_num, :integer
  end
end
