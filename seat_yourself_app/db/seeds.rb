# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jason = User.create(name: 'Jason', email:'funzone36@gmail.com')
spencer = User.create(name: 'Spencer', email:'spencer.dossett@gmail.com')
my_reservation = Reservation.create(reservation_date: '09/09/2015', reservation_time: 12, party_size: 4, notes: 'We only eat meat.')
my_restaurant = Restaurant.create(
  name: "Jason's house of meats",
  capacity: 5,
  # contact_info: '876-9876',
  # method_of_payments: 'cash',
  description: 'Tasty meat',
  address: '911 Police',
  open_time: 9,
  close_time: 23
  )

my_restaurant.owner = jason
my_reservation.user = spencer
my_reservation.restaurant = my_restaurant
jason.save
spencer.save
my_reservation.save
my_restaurant.save
