puts "🌱 Seeding records..."

# Seed your database here
User.create!(name: "James Jacob", email: "user@example.com")
puts "Created 1 user"

Author.create!(
  name: "George Orwell",
  bio:
    "George Orwell (1903-1950) was a British writer and journalist, best known for his novels Animal Farm and Nineteen Eighty-Four."
)
puts "Created 1 author"

puts "✅ Done seeding!"
