class Seat < ApplicationRecord
  belongs_to :airplane

  def to_s
    "{ #{group}: [#{x}, #{y}] }\n"
  end

end
