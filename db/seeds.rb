require "open-uri"

puts "Cleaning up existing data..."
Wishlist.destroy_all
Guest.destroy_all
Gift.destroy_all
Event.destroy_all
User.destroy_all

puts "Creating users..."

# User 1
user1 = User.create!(
  email: "ben@mail.com",
  password: "secret",
  first_name: "ben",
  last_name: "Martin",
  user_name: "Ben",
  phone_number: "0123456789"
)

# Attacher avatar pour user1
avatar_url = Faker::Avatar.image(slug: "alice", size: "150x150")
user1.avatar.attach(
  io: URI.open(avatar_url),
  filename: "alice_avatar.jpg",
  content_type: 'image/jpeg'
)

# User 2
user2 = User.create!(
  email: "bob@mail.com",
  password: "secret",
  first_name: "Bob",
  last_name: "Dupont",
  user_name: "bob_d",
  phone_number: "0987654321"
)

# Attacher avatar pour user2
avatar_url = Faker::Avatar.image(slug: "bob", size: "150x150")
user2.avatar.attach(
  io: URI.open(avatar_url),
  filename: "bob_avatar.jpg",
  content_type: 'image/jpeg'
)

# User 3 (nouveau)
user3 = User.create!(
  email: "charlie@mail.com",
  password: "secret",
  first_name: "Charlie",
  last_name: "Durand",
  user_name: "charlie_d",
  phone_number: "0147258369"
)

# Attacher avatar pour user3
avatar_url = Faker::Avatar.image(slug: "charlie", size: "150x150")
user3.avatar.attach(
  io: URI.open(avatar_url),
  filename: "charlie_avatar.jpg",
  content_type: 'image/jpeg'
)

# User 4 (nouveau)
user4 = User.create!(
  email: "diane@mail.com",
  password: "secret",
  first_name: "Diane",
  last_name: "Moreau",
  user_name: "diane_m",
  phone_number: "0369258147"
)

# Attacher avatar pour user4
avatar_url = Faker::Avatar.image(slug: "diane", size: "150x150")
user4.avatar.attach(
  io: URI.open(avatar_url),
  filename: "diane_avatar.jpg",
  content_type: 'image/jpeg'
)

puts "Creating Christmas event..."

christmas_event = Event.create!(
  name: "Noël 2025",
  date: Date.new(2025, 12, 25),
  organizer: user1
)

puts "Adding participants to Christmas event..."

# Tous les users participent à l'événement
[user1, user2, user3, user4].each do |user|
  christmas_event.add_participant(user)
end

puts "Creating gifts with Faker..."

# Cadeaux pour user1
5.times do |i|
  gift = Gift.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10.0..200.0),
    url: Faker::Internet.url,
    received: false,
    user: user1,
    tag: Gift::TAGS.sample
  )

  # Attacher image pour le cadeau
  image_url = "https://picsum.photos/300/300"
  gift.photo.attach(
    io: URI.open(image_url),
    filename: "gift_#{gift.id}.jpg",
    content_type: 'image/jpeg'
  )
end

# Cadeaux pour user2
5.times do |i|
  gift = Gift.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 15.0..150.0),
    url: Faker::Internet.url,
    received: false,
    user: user2,
    tag: Gift::TAGS.sample
  )

  # Attacher image pour le cadeau
  image_url = "https://picsum.photos/300/300"
  gift.photo.attach(
    io: URI.open(image_url),
    filename: "gift_#{gift.id}.jpg",
    content_type: 'image/jpeg'
  )
end

# Cadeaux pour user3
4.times do |i|
  gift = Gift.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 20.0..100.0),
    url: Faker::Internet.url,
    received: false,
    user: user3,
    tag: Gift::TAGS.sample
  )

  # Attacher image pour le cadeau
  image_url = "https://picsum.photos/300/300"
  gift.photo.attach(
    io: URI.open(image_url),
    filename: "gift_#{gift.id}.jpg",
    content_type: 'image/jpeg'
  )
end

# Cadeaux pour user4
4.times do |i|
  gift = Gift.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 25.0..180.0),
    url: Faker::Internet.url,
    received: false,
    user: user4,
    tag: Gift::TAGS.sample
  )

  # Attacher image pour le cadeau
  image_url = "https://picsum.photos/300/300"
  gift.photo.attach(
    io: URI.open(image_url),
    filename: "gift_#{gift.id}.jpg",
    content_type: 'image/jpeg'
  )
end

puts "Creating wishlists for Christmas event..."

# Ajouter quelques cadeaux de chaque user à la wishlist de Noël
Gift.all.sample(12).each do |gift|
  Wishlist.create!(
    gift: gift,
    event: christmas_event
  )
end

puts "Seed completed successfully!"
puts "Created:"
puts "- #{User.count} users"
puts "- #{Event.count} event"
puts "- #{Gift.count} gifts"
puts "- #{Guest.count} participants"
puts "- #{Wishlist.count} wishlist items"
