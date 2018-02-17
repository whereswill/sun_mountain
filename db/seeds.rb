# Users
User.create!(name:  "Admin User",
             email: "admin@example.com",
             password:              "password",
             password_confirmation: "password",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now,
             last_logged_in: Time.zone.now)

User.create!(name:  "Activate This User",
             email: "unactivated@example.com",
             password:              "password",
             password_confirmation: "password",
             admin:     true,
             activated: false,
             activated_at: nil,
             last_logged_in: Time.zone.now)

98.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               last_logged_in: Time.zone.now)
end
