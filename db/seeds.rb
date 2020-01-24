# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Sample users using faker gem
User.create!(name:  "Test User",
    email: "example@iamdenis.org",
    password:              "Password1",
    password_confirmation: "Password1")

50.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@iamdenis.org"
    password = "Password1"
    User.create!(name:  name,
        email: email,
        password: password,
        password_confirmation: password)
end

