# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


listing_1 = Listing.create(
  title: "Macbook Pro",
  description: "We're so brave",
  price: 100000.00,
)

user_1 = User.create(
  username: "Steve Jobs",
  password: "Apple"
)

user_1.listings << listing_1

user_2 = User.create(
  username: "Flatiron Student",
  password: "Macbooks"
)

order = Order.new()
order.listing = listing_1
order.buyer = user_2
order.save
