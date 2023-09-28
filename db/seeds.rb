# Destroying all existing data before creating new data
Item.destroy_all
RestaurantMenu.destroy_all
Customer.destroy_all
Restaurant.destroy_all
User.destroy_all

puts "Clearing the database..."

# GENERATE USERS!
puts "Creating users..."

User.create!(
  email: "user1@example.com",
  password: "password",
  restaurant_owner: false
)

User.create!(
  email: "user2@example.com",
  password: "password",
  restaurant_owner: false
)

User.create!(
  email: "user3@example.com",
  password: "password",
  restaurant_owner: true
)

User.create!(
  email: "user4@example.com",
  password: "password",
  restaurant_owner: true
)
puts "Finished creating users!"

# GENERATE CUSTOMERS!
puts "Creating customers..."

Customer.create!(
  name: "Customer 1",
  surname: "One",
  phone_number: "1234567890",
  address: "123 Main Road",
  user_id: User.find_by(email: "user1@example.com").id
)

Customer.create!(
  name: "Customer 2",
  surname: "Two",
  phone_number: "2345678901",
  address: "456 Main Road",
  user_id: User.find_by(email: "user2@example.com").id
)

puts "Finished creating customers!"

# GENERATE RESTAURANTS!

puts "Creating restaurants..."

Restaurant.create!(
  name: "Restaurant 1",
  category: "Italian",
  address: "123 Main Street",
  phone_number: "1111111111",
  opening_time: Time.parse("12:00 PM"),
  closing_time: Time.parse("6:00 PM"),
  user_id: User.find_by(email: "user3@example.com").id
)

Restaurant.create!(
  name: "Restaurant 2",
  category: "Mexican",
  address: "456 Main Street",
  phone_number: "2222222222",
  opening_time: Time.parse("12:00 PM"),
  closing_time: Time.parse("6:00 PM"),
  user_id: User.find_by(email: "user4@example.com").id
)

puts "Finished creating restaurants!"

# GENERATE RESTAURANT MENUS!

# puts "Creating restaurant menus..."

# RestaurantMenu.create!(
#   description: "Restaurant 1 Menu",
#   restaurant_id: Restaurant.find_by(name: "Restaurant 1").id
# )

# RestaurantMenu.create!(
#   description: "Restaurant 2 Menu",
#   restaurant_id: Restaurant.find_by(name: "Restaurant 2").id
# )

# puts "Finished creating restaurant menus!"

# GENERATE ITEMS ON MENU!

# puts "Creating menu items..."

# Item.create!(
#   category: "Starters",
#   item_name: "Focaccia",
#   item_price: 10,
#   restaurant_menus_id: RestaurantMenu.find_by(description: "Restaurant 1 Menu").id
# )

# Item.create!(
#   category: "Main Courses",
#   item_name: "Spaghetti Carbonara",
#   item_price: 20,
#   restaurant_menus_id: RestaurantMenu.find_by(description: "Restaurant 1 Menu").id
# )

# Item.create!(
#   category: "Desserts",
#   item_name: "Gelato",
#   item_price: 15,
#   restaurant_menus_id: RestaurantMenu.find_by(description: "Restaurant 1 Menu").id
# )

# Item.create!(
#   category: "Starters",
#   item_name: "Guacamole and Chips",
#   item_price: 10,
#   restaurant_menus_id: RestaurantMenu.find_by(description: "Restaurant 2 Menu").id
# )

# Item.create!(
#   category: "Main Courses",
#   item_name: "Tacos",
#   item_price: 20,
#   restaurant_menus_id: RestaurantMenu.find_by(description: "Restaurant 2 Menu").id
# )

# Item.create!(
#   category: "Desserts",
#   item_name: "Churros",
#   item_price: 15,
#   restaurant_menus_id: RestaurantMenu.find_by(description: "Restaurant 2 Menu").id
# )

# puts "Finished creating menu items!"

puts "ALL DATA HAS BEEN GENERATED! (finally)"
