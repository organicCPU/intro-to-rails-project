# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'
require 'csv'

def make_color
  color_count = Color.count
  color = rand(0..(color_count + 1))

  if color > color_count
    return nil
  else
    return Color.order('RANDOM()').first
  end
end

puts 'Database destroyed. Rebuilding database.'

# Reset database, starting with dependants first

Page.destroy_all
Page.create(title: 'About Us', content: 'This is a project that implements some Magic: The Gathering models with real world data.', permalink: 'about')

CardRuling.destroy_all
Ruling.destroy_all
Card.destroy_all

Color.destroy_all
Artist.destroy_all

# MTGJSON Additions

url = 'https://www.mtgjson.com/json/Standard.json'

def fetch(url)
  response = Net::HTTP.get(URI(url))
  JSON.parse(response)
end

## MTGJSON parsing into model format

all_cards = fetch(url)

all_cards.first.second do |expansion|
  expansion['cards'].each do |card|
    puts card.first
  end
end



# CSV Additions

CSV.foreach('db/csv/colors.csv', headers: true) do |row|
  Color.create(
    name: row['color']
  )
end

color_count = Color.count

# Faker Additions

faker_color_count = rand(1..3)

faker_color_count.times do
  Color.create(
    name: Faker::Color.color_name
  )
end

puts "Added #{Color.count} colors to the database: #{color_count} of them being from a CSV file, and #{faker_color_count} from faker."

faker_artist_count = rand(3..5)

faker_artist_count.times do
  artist = Artist.create(
    name: Faker::Name.unique.name
  )

  rand(10..50).times do
    card = artist.cards.build(
      name: Faker::Name.unique.name,
      color: make_color,
      converted_mana_cost: rand(0...10),
      display_type: Faker::Hipster.word.capitalize,
      power: rand(1...8),
      toughness: rand(1...8),
      rarity: Faker::Hipster.word.capitalize,
      flavor_text: Faker::Quote.famous_last_words
    )

    card.save
  end
end

rand(0...15).times do
  ruling = Ruling.new(
    title: Faker::Music.unique.album,
    description: Faker::Hipster.unique.paragraph
  )

  ruling.save

  rand(1...3).times do
    CardRuling.create(
      ruling: ruling,
      card: Card.order('RANDOM()').first
    )
  end
end

puts "Added #{Artist.count} artists to the database: #{faker_artist_count} of them are from faker."
puts "Added #{Ruling.count} rulings to the database."
puts "Added #{Card.count} cards to the database."
puts "Added #{CardRuling.count} card ruling associations to the database."
puts 'Database populated.'
