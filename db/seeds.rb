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

# Accounts
55.times do |n|
  Account.create!(address1:     Faker::Address.street_address,
                   address2:    Faker::Address.secondary_address,
                   city:        Faker::Address.city,
                   state:       Faker::Address.state_abbr,
                   zip_code:    Faker::Address.zip_code,
                   notes:       Faker::Seinfeld.quote,
                   first_name:  Faker::Name.first_name,
                   last_name:   Faker::Name.last_name,
                   account_number:   Faker::Number.number(4),
                   phone:       Faker::PhoneNumber.phone_number,
                   email:       "email-#{n+1}@example.com")
end

# Mailing Addresses
accounts = Account.order(:account_number).take(6)
  accounts.each do |account|
    account.create_mailing_address!(address1:     Faker::Address.street_address,
                                   address2:    Faker::Address.secondary_address,
                                   city:        Faker::Address.city,
                                   state:       Faker::Address.state_abbr,
                                   zip_code:    Faker::Address.zip_code)
  end

