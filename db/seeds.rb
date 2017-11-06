require 'faker'

User.destroy_all
Wiki.destroy_all

User.create(email: 'test@user.com', password: 'password',
  confirmed_at: Time.now
)

user = User.last

  # Create Wikis
  50.times do
    Wiki.create!(
      title:  Faker::Seinfeld.character,
      body:   Faker::Seinfeld.quote,
      user: user
    )
  end

  wikis = Wiki.all
  users = User.all

  admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 2
)

premium = User.create!(
  email: 'premium@example.com',
  password: 'password',
  confirmed_at: Time.now,
)

standard = User.create!(
  email: 'standard@example.com',
  password: 'password',
  confirmed_at: Time.now,
)


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
