class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.integer :group
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
