puts '🌱 Seeding records...'

# Seed your database here
User.create!(name: 'James Jacob', email: 'user@example.com')
puts 'Created 1 user'

Author.create!(name: 'George Orwell',
               bio: "George Orwell (1903-1950) was a British writer and journalist, best known for his novels Animal Farm
               and Nineteen Eighty-Four. He was a passionate advocate for democratic socialism and a fierce critic of
                totalitarianism and oppressive regimes. Orwell's works are celebrated for their incisive social
                commentary, and his ideas have had a profound impact on modern political discourse.")
puts 'Create 1 author'

puts '✅ Done seeding!'
