# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tag_number = 1
until tag_number == 5 do
  tag = Tag.create title: "Category ##{tag_number}"

  tag_number+=1
end


post_number = 1
until post_number == 20 do
  post = Post.create title: "Post title #{post_number}" tag_id: Tag.all.sample

  post_number+=1
end

# Post.create!(title: 'Oliver Kahn')
# Post.create!(title: 'Luke Skywalker')
# Post.create!(title: 'Tracey Chaplin')
# Post.create!(title: 'Ellie Goulding')
