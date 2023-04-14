puts "🌱 Seeding records..."

# Seed users
User.create(
  name: "Morrie Morrison",
  email: "user@example.net",
  password: "pass"
)

3.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.safe_email,
    password: "pass"
  )
end

# Seed authors
3.times { Author.create(name: Faker::Book.author, bio: Faker::Lorem.paragraph) }

# Seed books
10.times do
  book =
    Book.create(
      title: Faker::Book.unique.title,
      description: Faker::Lorem.paragraph,
      date_of_publication:
        Faker::Date.between(from: "1990-01-01", to: "2023-04-09"),
      quantity: Faker::Number.between(from: 1, to: 100),
      price: [250_000, 200_000, 150_000, 450_000].sample
    )

  # Assign up to 3 random authors to the book
  rand(1..3).times do
    author = Author.offset(rand(Author.count)).first
    book.authors << author unless book.authors.include?(author)
  end
end

puts "✅ Done seeding!"
