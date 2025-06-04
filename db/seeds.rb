# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning up existing data..."
User.destroy_all


puts "Creating users..."
user1= User.create!(email: "ben@mail.com", password: "password",  user_name: "Bensouc")
avatar1 = Rails.root.join("app/assets/images/avatars/bmo_avatar.png").open
user1.avatar.attach(io: avatar1, filename: "avatar1.png", content_type: "bmo_avatar/png")
user1.save!

puts "Creating Gifts"
# get user wishlist
wishlist = user1.wishlist
# create a gift
Gift.create!([
  {
    name: "Montre connectée",
    price: 199.99,
    url: "https://example.com/montre-connectee",
    received: false,
    user: user1
  },
  {
    name: "Casque audio",
    price: 89.50,
    url: "https://example.com/casque-audio",
    received: true,
    user: user1
  },
  {
    name: "Carte cadeau Amazon",
    price: 50.0,
    url: "https://amazon.fr/gift-card",
    received: false,
    user: user1
  }
])
# create a wish to link the gift to the wishlist
