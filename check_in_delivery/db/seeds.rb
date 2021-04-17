User.destroy_all
Delivery.destroy_all

3.times do
    User.create(first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    username: Faker::Name.initials,
    password_digest: "password")
end 

25.times do 
    Delivery.create(location: Faker::Address.city,
    qty_lamps: Faker::Number.between(from: 1, to: 10),
    qty_housings: Faker::Number.between(from: 1, to: 10),
     qty_trims: Faker::Number.between(from: 1, to: 10),
     qty_fixtures: Faker::Number.between(from: 1, to: 10),
     checked_in: false,
     expected_product: false,
     notes: " ",
     user: User.all.sample)
end

puts "seeds planted"