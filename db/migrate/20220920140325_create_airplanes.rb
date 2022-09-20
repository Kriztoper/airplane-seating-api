class CreateAirplanes < ActiveRecord::Migration[6.1]
  def change
    create_table :airplanes do |t|
      t.string :name

      t.timestamps
    end
  end
end
