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
  description: "We're so brave. Our laptops have -0.1mm keyboard travel,
                half of a usb C port, and a new, forward-thinking touchbar.
                Think different.",
  price: 2995.95,
  currency: "USD",
  stock_quantity: 10,
  image_url: "https://store.storeimages.cdn-apple.com/8750/as-images.apple.com/is/image/AppleInc/aos/published/images/m/bp/mbp13/gray/mbp13-gray-select-201610_GEO_TH?wid=452&hei=420&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1495927484878"
)

listings << listing_2 = Listing.new(
  title: "HP Envy x2",
  description: "Introducing our new HP Envy x2: Vivid, FHD touch display, silent fanless design,
                two in one laptop and tablet.",
  price: 0.12,
  currency: "BTC",
  stock_quantity: 10,
  image_url: "https://www.windowscentral.com/sites/wpcentral.com/files/styles/xlarge_wm_blw/public/field/image/2017/12/hp-envy-x2.jpg?itok=Gt7RyFVE"
)

listings << listing_3 = Listing.new(
  title: "Razer Blade",
  description: "Ultimate thin and light gaming. Powerful, portable, perfect. 
                Featuring Intel's core-i7 7700hq and Nvidia's gtx 1060",
  price: 3.41,
  currency: "ETH",
  stock_quantity: 10,
  image_url: "https://assets.pcmag.com/media/images/470577-bigger-display.jpg?width=640&height=360"
)
listings << listing_4 = Listing.new(
  title: "eMachines",
  description: "old, sold as is. This beauty was top of the line back in 1999! Prepare yourselves for the ultimate in computing.",
  price: 495.95,
  currency: "USD",
  stock_quantity: 10,
  image_url: "https://assets.pcmag.com/media/images/109553-emachines-t3302.jpg?width=333&height=245"
)
listings << listing_5 = Listing.new(
  title: "MSI GS65 Stealth",
  description: "Latest Intel 8th gen 6-core i7 processor. Nvidia gtx-1070 max-q. World's first 144hz thin bezel gaming laptop.",
  price: 1999.95,
  currency: "USD",
  stock_quantity: 10,
  image_url: "https://www.msi.com/asset/resize/image/global/product/product_8_20180314154651_5aa8d36baba40.png62405b38c58fe0f07fcef2367d8a9ba1/600.png"
)

listings << listing_6 = Listing.new(
  active: true,
  title: "Lenovo Y520",
  description: "powerful gaming laptop now at at a more affordable price",
  price: 7000.00,
  currency: "USD",
  stock_quantity: 5,
  image_url: "https://www3.lenovo.com/medias/lenovo-y520-amd-nvidia.png?context=bWFzdGVyfHJvb3R8NjA3NTF8aW1hZ2UvcG5nfGgzMi9oOWYvOTU4Mjk3ODM2NzUxOC5wbmd8ZmI1MGI4NTU0NGM5NTgyYjVlYzY0YTc3ODEyOGU1MzdlNWVmZDYzMTQyZWYyNDc4YTM5ODMxYzRiNDgzY2QyZA"
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

user_3 = User.create(
  username: "Flatiron_Student",
  password: "Macbooks1234",
  email: "student@flatironschool.com"
)

user_1.listings << [listing_1, listing_2]
user_2.listings << [listing_3, listing_4, listing_5]
user_3.listings << listing_6

User.all.each do |user|
  user.wallet = Wallet.create(Wallet.default_wallet_hash)
  user.save
end

# Bill gates buys Macbook Pro from Steve Jobs
order = Order.new()
order.listing = listing_1
order.buyer = user_2
order.save

#Flatiron student buys Macbook Pro from Steve Jobs
order_2 = Order.new()
order_2.listing = listing_1
order_2.buyer = user_3
order_2.save

listings.each{|l| l.save}

#Bill Gates reviews Macbook Pro order from Steve Jobs
review = Review.new(content: "Apple sucks, buy Microsoft", rating: 1.0)
review.order = order
review.save

#Flatiron Student reviews Macbook Pro order from Steve Jobs
review_2 = Review.new(content: "I feel so BRAVE nao!", rating: 4.0)
review_2.order = order_2
review_2.save






