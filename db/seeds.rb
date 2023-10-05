# Destroying all existing data before creating new data
Item.destroy_all
RestaurantMenu.destroy_all
Customer.destroy_all
Restaurant.destroy_all
User.destroy_all

puts "Clearing the database..."

# GENERATE USERS!
puts "Creating users..."

# CUSTOMER ACCOUNTS

User.create!(
  email: "jt@thedestroyer.com",
  password: "password",
  restaurant_owner: false
)

User.create!(
  email: "stricko@yeamate.com",
  password: "password",
  restaurant_owner: false
)
# RESTAURANT OWNERS ACCOUNTS

User.create!(
  email: "laitaliano@restaurant.com",
  password: "password",
  restaurant_owner: true
)

User.create!(
  email: "senormexicana@restaurant.com",
  password: "password",
  restaurant_owner: true
)

User.create!(
  email: "plushi@restaurant.com",
  password: "password",
  restaurant_owner: true
)

User.create!(
  email: "hugosmussels@restaurant.com",
  password: "password",
  restaurant_owner: true
)

User.create!(
  email: "southsideshawns@restaurant.com",
  password: "password",
  restaurant_owner: true
)

User.create!(
  email: "sebghetticarrbonara@restaurant.com",
  password: "password",
  restaurant_owner: true
)

User.create!(
  email: "onlyfools@restaurant.com",
  password: "password",
  restaurant_owner: true
)

User.create!(
  email: "hesheng@restaurant.com",
  password: "password",
  restaurant_owner: true
)

puts "Finished creating users!"

# GENERATE CUSTOMERS!
puts "Creating customers..."

Customer.create!(
  name: "JT",
  surname: "The Destroyer",
  phone_number: "1234567890",
  address: "123 Main Road",
  user_id: User.find_by(email: "jt@thedestroyer.com").id
)

Customer.create!(
  name: "Liam",
  surname: "Stricko",
  phone_number: "098 765 4321",
  address: "456 Main Road",
  user_id: User.find_by(email: "stricko@yeamate.com").id
)

puts "Finished creating customers!"

# GENERATE RESTAURANTS!

puts "Creating restaurants..."

Restaurant.create!(
  name: "La Italiano",
  category: "Italian",
  address: "6 Rhine Road, Cape Town",
  phone_number: "123 456 7890",
  opening_time: Time.parse("12:00 PM"),
  closing_time: Time.parse("6:00 PM"),
  user_id: User.find_by(email: "laitaliano@restaurant.com").id
)

Restaurant.create!(
  name: "Senòr Mexicana",
  category: "Mexican",
  address: "2 Forth Road, Cape Town",
  phone_number: "123 456 7890",
  opening_time: Time.parse("12:00 PM"),
  closing_time: Time.parse("6:00 PM"),
  user_id: User.find_by(email: "senormexicana@restaurant.com").id
)

Restaurant.create!(
  name: "Plushi",
  category: "Sushi",
  address: "12 Ravenscraig Road, Woodstock, Cape Town",
  phone_number: "123 456 7890",
  opening_time: Time.parse("12:00 PM"),
  closing_time: Time.parse("6:00 PM"),
  user_id: User.find_by(email: "plushi@restaurant.com").id
)

Restaurant.create!(
  name: "Hugo's Mussels",
  category: "Seafood",
  address: "2 Cannery Road, Cape Town",
  phone_number: "123 456 7890",
  opening_time: Time.parse("12:00 PM"),
  closing_time: Time.parse("6:00 PM"),
  user_id: User.find_by(email: "hugosmussels@restaurant.com").id
)

Restaurant.create!(
  name: "Southside Shawn's",
  category: "Bar & Pub",
  address: "4 Lytton Street, Observatory, Cape Town",
  phone_number: "123 456 7890",
  opening_time: Time.parse("12:00 PM"),
  closing_time: Time.parse("6:00 PM"),
  user_id: User.find_by(email: "southsideshawns@restaurant.com").id
)

Restaurant.create!(
  name: "Sebghetti Carrbonara",
  category: "Sicillian",
  address: "14 Rhine Road, Cape Town",
  phone_number: "123 456 7890",
  opening_time: Time.parse("12:00 PM"),
  closing_time: Time.parse("6:00 PM"),
  user_id: User.find_by(email: "sebghetticarrbonara@restaurant.com").id
)

Restaurant.create!(
  name: "Only Fools",
  category: "Burgers",
  address: "82 Regent Road, Cape Town",
  phone_number: "123 456 7890",
  opening_time: Time.parse("12:00 PM"),
  closing_time: Time.parse("6:00 PM"),
  user_id: User.find_by(email: "onlyfools@restaurant.com").id
)

Restaurant.create!(
  name: "HeSheng",
  category: "Chinese",
  address: "269 Main Road, Cape Town",
  phone_number: "123 456 7890",
  opening_time: Time.parse("12:00 PM"),
  closing_time: Time.parse("6:00 PM"),
  user_id: User.find_by(email: "hesheng@restaurant.com").id
)

puts "Finished creating restaurants!"

# GENERATE RESTAURANT MENUS!

puts "Creating restaurant menus..."

la_italiano = Restaurant.find_by(name: "La Italiano")
senor_mexicana = Restaurant.find_by(name: "Senòr Mexicana")
plushi = Restaurant.find_by(name: "Plushi")
hugos_mussels = Restaurant.find_by(name: "Hugo's Mussels")
southside_shawns = Restaurant.find_by(name: "Southside Shawn's")
sebghetti_carrbonara = Restaurant.find_by(name: "Sebghetti Carrbonara")
only_fools = Restaurant.find_by(name: "Only Fools")
hesheng = Restaurant.find_by(name: "HeSheng")

la_italiano_menu = RestaurantMenu.create!(
  description: "La Italiano Menu",
  restaurant: la_italiano
)

senor_mexicana_menu = RestaurantMenu.create!(
  description: "Senòr Mexicana Menu",
  restaurant: senor_mexicana
)

plushi_menu = RestaurantMenu.create!(
  description: "Plushi Menu",
  restaurant: plushi
)

hugos_mussels_menu = RestaurantMenu.create!(
  description: "Hugo's Mussels Menu",
  restaurant: hugos_mussels
)

southside_shawns_menu = RestaurantMenu.create!(
  description: "Southside Shawn's",
  restaurant: southside_shawns
)

sebghetti_carrbonara_menu = RestaurantMenu.create!(
  description: "Sebghetti Carrbonara",
  restaurant: sebghetti_carrbonara
)

only_fools_menu = RestaurantMenu.create!(
  description: "Only Fools",
  restaurant: only_fools
)

hesheng_menu = RestaurantMenu.create!(
  description: "HeSheng",
  restaurant: hesheng
)

puts "Finished creating restaurant menus!"

# # GENERATE ITEMS ON MENU!

# puts "Creating menu items..."

Item.create!(
  category: "starter",
  item_name: "Shrimp",
  item_price: 75,
  restaurant_menu: hugos_mussels_menu
)

Item.create!(
  category: "main",
  item_name: "Steak & Onyons",
  item_price: 150,
  restaurant_menu: hugos_mussels_menu
)

Item.create!(
  category: "drink",
  item_name: "Mixed Meat Smoothie",
  item_price: 95,
  restaurant_menu: hugos_mussels_menu
)

Item.create!(
  category: "starter",
  item_name: "Sardines",
  item_price: 70,
  restaurant_menu: hugos_mussels_menu
)

Item.create!(
  category: "main",
  item_name: "Lamb Chops",
  item_price: 120,
  restaurant_menu: hugos_mussels_menu
)

Item.create!(
  category: "main",
  item_name: "Massive Prawns",
  item_price: 145,
  restaurant_menu: hugos_mussels_menu
)

Item.create!(
  category: "dessert",
  item_name: "Protein Ice Cream & Creatine Sprinkles",
  item_price: 75,
  restaurant_menu: hugos_mussels_menu
)

Item.create!(
  category: "drink",
  item_name: "Chef's Special: Pre-Workout",
  item_price: 250,
  restaurant_menu: hugos_mussels_menu
)

Item.create!(
  category: "dessert",
  item_name: "Chocolate Protein Cake",
  item_price: 75,
  restaurant_menu: hugos_mussels_menu
)

puts "Finished creating menu items!"

puts "..."
puts "ALL DATA HAS BEEN GENERATED - (LFG!!!))"
