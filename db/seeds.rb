# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

Post.destroy_all

5.times do
  post = Post.create(
    :title => Faker::Lorem.sentence(rand(3..10)).chomp('.'),
    :title => Faker::Lorem.sentence(rand(5..10)).chomp('.'),
    :content => Faker::Lorem.paragraphs(rand(5..15)).join('\n')
    )
end
