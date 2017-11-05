require 'random_data'

User.destroy_all
Wiki.destroy_all

User.create(email: 'test@user.com', password: 'password',
  confirmed_at: Time.now
)

user = User.last

  # Create Wikis
  50.times do
    Wiki.create!(
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph,
      user: user
    )
  end

puts "Seed finished"
puts "#{Wiki.count} wikis created"
