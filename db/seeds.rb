# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create users
10.times do
    User.create({
        email: Faker::Internet.email,
        password: '123456'
    })
end

#create wikis

50.times do
    Wiki.create({
        body:  Faker::Lorem.paragraph,
        title: Faker::Lorem.sentence,
        user: User.all.sample
    })
end

puts "you now have #{User.all.count} users"
puts "you now have #{Wiki.all.count} wikis"

