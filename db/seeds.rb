# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

JoinTableGossipTag.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('jointablegossiptags')
Gossip.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('gossips')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
City.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cities')
Tag.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('tags')
Like.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('likes')


def generate_title
  title = Faker::Movie.title
  while title.length < 3 || title.length > 14
    title = Faker::Movie.title
  end
  title
end

10.times do 
  city = City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end
#creation d'un utilisateur par default pour les gossips générés onlines
default_user = User.create!(
  first_name: "Formulaire",
  last_name: "Entrée manuellement",
  description: "Ce profil est créé dans l'attente d'utilisateur réel sur mon site pour associer mes gossips généré manuellement à un utilisateur",
  email: "test123@test.com",
  age: Faker::Number.between(from: 18, to: 100),
  city: City.all.sample,
  password: "123456"
)

10.times do 
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.paragraph,
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 18, to: 100),
    city: City.all.sample,
    password: "123456"
  )
  
end

20.times do 
  gossip = Gossip.create!(
    title: generate_title,
    content: Faker::ChuckNorris.fact,
    user: User.where.not(id: 1).sample
  )
end


50.times do 
  comment = Comment.create!(

    content: Faker::Quote.famous_last_words,
    gossip: Gossip.all.sample
  )
end

10.times do
  tag = Tag.create!(
    title: generate_title
  )
end

20.times do 
  jointablegossiptag = JoinTableGossipTag.create!(
    gossip: Gossip.all.sample,
    tag: Tag.all.sample
  )
end