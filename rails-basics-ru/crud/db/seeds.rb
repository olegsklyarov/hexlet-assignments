# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Task.create do |task|
    task.name = Faker::Hobby.activity
    task.status = ['new', 'in progress', 'done'].sample
    task.creator = Faker::FunnyName.name
    task.completed = Faker::Boolean.boolean
    task.description = Faker::Lorem.paragraph(sentence_count: 5) if Faker::Boolean.boolean
    task.performer = Faker::FunnyName.name if Faker::Boolean.boolean
  end
end
