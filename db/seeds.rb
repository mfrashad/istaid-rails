require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r = Random.new

User.create(
  name: 'icad123',
  email: 'icad@email.com',
  password: 'icad12345',
  role: 'admin'
)

3.times do
  Category.create(
    name: Faker::Job.field
  )
end

10.times do
  Post.create(
    title: Faker::Lorem.word,
    body: Faker::Lorem.sentence,
    user_id: 1,
    category_id: r.rand(Category.count) + 1
  )
end
