# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_count = 100 || ENV['SEED_COUNT']

begin
  seed_count.times do
    addr = Address.create!(
      line_1: Faker::Address.building_number,
      line_2: Faker::Address.street_address,
      city: Faker::Address.city,
      state: (rand > 0.5 ? Faker::Address.state : Faker::Address.state_abbr),
      zip_code: Faker::Address.zip.gsub(/-.*$/, '')
    )
    contact = Contact.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name.chomp,
      address: addr
    )
    [1,2,3].sample.times do
      contact.phone_numbers.create(
        number: sprintf('%d%d%d-%d%d%d-%d%d%d%d', *(0..9).to_a.shuffle)
      )
    end
  end
rescue
end
