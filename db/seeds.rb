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
Card.destroy_all
Color.destroy_all
Artist.destroy_all

# MTGJSON Additions

url = 'https://www.mtgjson.com/json/Standard.json'

def fetch(url)
  JSON.parse(open(url).read)
end

# cards = fetch(url)

# Faker Additions

6.times do
  Color.create(
    name: Faker::Color.color_name
  )
end

rand(3...5).times do
  artist = Artist.create(
    name: Faker::Name.unique.name
  )

  rand(3..15).times do
    card = artist.cards.build(
      name: Faker::Name.unique.name,
      color_id: Color.order('RANDOM()').first.id,
      convertedCost: rand(0...10),
      power: rand(1...8),
      toughness: rand(1...8),
      rarity: Faker::Hipster.word,
      flavorText: Faker::Hipster.sentence(word_count: 3, supplemental: true)
    )

    card.save

    rand(0...2).times do
      card.ruling.build(
        description: Faker::Hipster.paragraph
      ).save
    end
  end
end

puts 'Database populated.'