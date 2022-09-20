# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airplane1 = Airplane.create(name: 'Airplane 1')
Seat.create(airplane: airplane1, group: 1, x: 0, y: 0)
Seat.create(airplane: airplane1, group: 1, x: 1, y: 0)