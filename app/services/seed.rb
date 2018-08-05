# require 'faker'
# class Seed
#   def initialize
#   end

#   def category(amount = 10)
#     amount.times do
#       Category.create(
#         name: Faker::Job.field
#       )
#     end
#   end

#   def post(amount = 10)
#     r = Random.new
#     amount.times do
#       title = Faker::Lorem.word
#       Post.create(
#         title: title,
#         slug: slugify(title),
#         body: Faker::Lorem.paragraph,
#         image_url: "/images/masonry/sample-#{r.rand(10)}.jpg",
#         user_id: 1,
#         category_id: r.rand(Category.count) + 1
#       )
#     end
#   end

#   def slugify(string)
#     string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
#   end
# end
