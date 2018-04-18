# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# def define_wallet
#   wallet_hash = {
#     usd_balance: 100000.00,
#     btc_address: Faker::Crypto.sha256,
#     btc_balance: 1.0,
#     eth_address: Faker::Crypto.sha256,
#     eth_balance: 2.0,
#     ltc_address: Faker::Crypto.sha256,
#     ltc_balance: 7.0
#   }
# end

listings = []
listings << listing_1 = Listing.new(
  title: "Macbook Pro",
  description: "We're so brave",
  price: 100000.00,
  stock_quantity: 10,
  image_url: "https://store.storeimages.cdn-apple.com/8750/as-images.apple.com/is/image/AppleInc/aos/published/images/m/bp/mbp13/gray/mbp13-gray-select-201610_GEO_TH?wid=452&hei=420&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1495927484878"
)

listings << listing_2 = Listing.new(
  title: "HP Envy",
  description: "Windows best",
  price: 90000.00,
  stock_quantity: 10,
  image_url: "https://store.storeimages.cdn-apple.com/8750/as-images.apple.com/is/image/AppleInc/aos/published/images/m/bp/mbp13/gray/mbp13-gray-select-201610_GEO_TH?wid=452&hei=420&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1495927484878"
)

listings << listing_3 = Listing.new(
  title: "Razer Blade",
  description: "Ultimate thin and light gaming",
  price: 120000.00,
  stock_quantity: 10,
  image_url: "https://store.storeimages.cdn-apple.com/8750/as-images.apple.com/is/image/AppleInc/aos/published/images/m/bp/mbp13/gray/mbp13-gray-select-201610_GEO_TH?wid=452&hei=420&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1495927484878"
)
listings << listing_4 = Listing.new(
  title: "eMachines",
  description: "old, sold as is",
  price: 1000.00,
  stock_quantity: 10,
  image_url: "https://store.storeimages.cdn-apple.com/8750/as-images.apple.com/is/image/AppleInc/aos/published/images/m/bp/mbp13/gray/mbp13-gray-select-201610_GEO_TH?wid=452&hei=420&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1495927484878"
)
listings << listing_5 = Listing.new(
  title: "MSI GS65VR",
  description: "1070 max q",
  price: 120000.00,
  stock_quantity: 10,
  image_url: "https://store.storeimages.cdn-apple.com/8750/as-images.apple.com/is/image/AppleInc/aos/published/images/m/bp/mbp13/gray/mbp13-gray-select-201610_GEO_TH?wid=452&hei=420&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1495927484878"
)



user_1 = User.create(
  username: "Steve_Jobs",
  password: "Apple1234",
  email: "steve@apple.com"
)
user_2 = User.create(
  username: "Bill_Gates",
  password: "Microsoft1234",
  email: "bill@microsoft.com"
)

user_1.listings << [listing_1, listing_2]
user_2.listings << [listing_3, listing_4, listing_5]

user_3 = User.create(
  username: "Flatiron_Student",
  password: "Macbooks1234",
  email: "student@flatironschool.com"
)

order = Order.new()
order.listing = listing_1
order.buyer = user_2
order.save

listings.each{|l| l.save}

User.all.each do |user|
  user.wallet = Wallet.create(Wallet.default_wallet_hash)
  user.save
end
