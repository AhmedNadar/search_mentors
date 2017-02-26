# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# 10.times do
#   p = Profile.create!(
#     summery:    Faker::Hipster.paragraph(2, true, 4),
#     city:       Faker::Address.city,
#     country:    Faker::Address.country,
#     gender:     Faker::Demographic.sex,
#     first_name: Faker::Name.first_name,
#     last_name:  Faker::Name.last_name,
#     company:    Faker::Company.name
#   )
# end

20.times do
  Skill.create!(    name: Faker::Job.key_skill )
  Industry.create!( name: Faker::Commerce.department )
  Job.create!(      name: Faker::Job.title )
end
