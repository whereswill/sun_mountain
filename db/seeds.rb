# Users
User.create!(name:  "Admin User",
             email: "example@oregonrafting.com",
             password:              "ouzel123",
             password_confirmation: "ouzel123",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now,
             last_logged_in: Time.zone.now)

User.create!(name:  "Unactivated User",
             email: "will@oregonrafting.com",
             password:              "ouzel123",
             password_confirmation: "ouzel123",
             admin:     true,
             activated: false,
             activated_at: nil,
             last_logged_in: Time.zone.now)

98.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@oregonrafting.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               last_logged_in: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Hipster.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
