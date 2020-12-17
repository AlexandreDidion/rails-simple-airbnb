puts 'cleaning database...'

Flat.destroy_all

puts 'creating new flats...'

4.times do
  Flat.create!(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    description: Faker::Company.catch_phrase,
    price_per_night: rand(75..100),
    number_of_guests: rand(2..6),
    picture_url: 'https://source.unsplash.com/random'
  )
end

puts 'DOne!'
