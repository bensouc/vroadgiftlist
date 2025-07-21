# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
puts "Cleaning up existing data..."
Event.destroy_all
Gift.destroy_all
Guest.destroy_all
User.destroy_all


puts "Creating users..."
user1= User.create!(email: "ben@mail.com", password: "password",  user_name: "Bensouc")
avatar1 = Rails.root.join("app/assets/images/avatars/bmo_avatar.png").open
user1.avatar.attach(io: avatar1, filename: "avatar1.png", content_type: "bmo_avatar/png")
user1.save!

puts "Creating Gifts"
# get user event
event = user1.events
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
    name: "Carte cadeau Poàrtails Nantes",
    price: 50.0,
    url: "https://www.librairieludiqueportails.fr/",
    received: false,
    user: user1
  }
])
puts "Attaching photos to gifts..."
  photo_url = "https://www.histoiredor.com/dw/image/v2/BCQS_PRD/on/demandware.static/-/Sites-THOM_CATALOG/default/dwe6284d31/images/70580155704-master_HO.jpg?sw=380&sh=380"
  transformed_url = photo_url.sub('/upload/', '/upload/w_500/')
  gift = Gift.find_by(name: "Montre connectée")
  gift.photo.attach(
    io: URI.open(transformed_url),
    filename: "#{gift.name.downcase.gsub(' ', '_')}.jpg",
    content_type: 'image/jpeg'
  )
  gift.save!
  photo_url = "https://content.pearl.fr/media/cache/default/article_ultralarge_high_nocrop/shared/images/articles/T/TG2/casque-audio-sans-fil-tempo-ref_TG2842_3.jpg"
  transformed_url = photo_url.sub('/upload/', '/upload/w_500/')
  gift = Gift.find_by(name: "Casque audio")
  gift.photo.attach(
  io: URI.open(transformed_url),
  filename: "#{gift.name.downcase.gsub(' ', '_')}.jpg",
  content_type: 'image/jpeg'
)
  gift.save!
  photo_url = "https://www.librairieludiqueportails.fr/uploads/images/logo_Logo_Portails_vaisseau.gif"
  transformed_url = photo_url.sub('/upload/', '/upload/w_500/')
  gift = Gift.last
  gift.photo.attach(
  io: URI.open(transformed_url),
  filename: "#{gift.name.downcase.gsub(' ', '_')}.gif",
  content_type: 'image/jpeg'
)
  gift.save!
# create a wish to link the gift to the event
