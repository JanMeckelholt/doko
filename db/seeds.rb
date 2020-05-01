# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    #Card.all_values.keys.each do |value|
    #  Card.all_suits.each do|suit| 
    #    card = Card.create!(value: value, suit: suit)
    #  end
    #end

#game = Game.create!
player = Player.create!(email: "ab@c.de", password: "123456")

  CARDS = [
    "Herz_Zehn",
    "Kreuz_Dame",
    "Pik_Dame",
    "Herz_Dame",
    "Karo_Dame",
    "Kreuz_Bube",
    "Pik_Bube",
    "Herz_Bube",
    "Karo_Bube",
    "Karo_Ass",
    "Karo_Zehn",
    "Karo_Koenig",
    "Kreuz_Ass",
    "Kreuz_Zehn",
    "Kreuz_Koenig",
    "Pik_Ass",
    "Pik_Zehn",
    "Pik_Koenig",
    "Herz_Ass",
    "Herz_Koenig"
  ]

game = Game.create!
deck = Deck.create!(game: game)

CARDS.each do |card|
	Card.create!(name: card, deck: deck)
    Card.create!(name: card, deck: deck)
end