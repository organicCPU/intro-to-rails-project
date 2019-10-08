# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

# Reset database

Ruling.destroy_all
Color.destroy_all
Artist.destroy_all
Card.destroy_all

# MTGJSON Additions

url = 'https://www.mtgjson.com/json/Standard.json'

def fetch(url)
  JSON.parse(open(url).read)
end

# cards = fetch(url)

# Faker Additions

number_of_artists = rand(3..5)
number_of_cards = rand(10..15)

6.times do
  Color.create(
    name: Faker::Color.color_name
  )
end

number_of_artists.times do
  artist = Artist.create(
    name: Faker::Name.unique.name
  )

  number_of_cards.times do
    artist.cards.build(
      name: Faker::Name.unique.name,
      color_id: Color.order('RANDOM()').first.id,
      convertedCost: 5,
      power: 1,
      toughness: 1,
      rarity: 'super rare',
      flavorText: 'lol'
    ).save
  end
end
