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
  Account.create!( notes:       Faker::Seinfeld.quote,
                   first_name:  Faker::Name.first_name,
                   last_name:   Faker::Name.last_name,
                   account_number:   Faker::Number.number(3) + n.to_s,
                   phone:       Faker::PhoneNumber.phone_number,
                   email:       "email-#{n+1}@example.com")
end

#  Addresses
accounts = Account.all
accounts.each do |account|
  account.addresses.create!(address_type:     "delivery",
                          care_of:      Faker::Name.name,
                          address1:     Faker::Address.street_address,
                          address2:     Faker::Address.secondary_address,
                          city:         Faker::Address.city,
                          state:        Faker::Address.state_abbr,
                          zip_code:     Faker::Address.zip_code)
end

accounts = Account.order(:account_number).take(5)
accounts.each do |account|
    account.addresses.create!(address_type:      "mailing",
                            care_of:      Faker::Name.name,
                            address1:     Faker::Address.street_address,
                            address2:     Faker::Address.secondary_address,
                            city:         Faker::Address.city,
                            state:        Faker::Address.state_abbr,
                            zip_code:     Faker::Address.zip_code)
end

#  Invoices
accounts = Account.all
accounts.each do |account|
  account.invoices.create!(status:      "draft",
                          notes:        Faker::Seinfeld.quote,
                          late_fee:     nil)
end

accounts = Account.all
accounts.each do |account|
  5.times do |n|
    account.invoices.create!(status:      "paid",
                            notes:        Faker::Seinfeld.quote,
                            late_fee:     nil)
  end
end
