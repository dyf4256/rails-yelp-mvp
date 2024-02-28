# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning database...'

Restaurant.destroy_all

category = %w[chinese italian japanese french belgian]
puts 'Creating restaurants...'

7.times do
  restaurant = Restaurant.new
  restaurant.name = Faker::Restaurant.name
  restaurant.address = Faker::Address.full_address
  restaurant.category = category.sample
  restaurant.phone_number = Faker::PhoneNumber.cell_phone
  restaurant.save!
  puts "Create #{restaurant.name}"
end

puts 'Finished!'
