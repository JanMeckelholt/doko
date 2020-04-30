class Deck < ActiveRecord::Base
 # include ActiveModel::Model
  has_many :cards, -> { order(Arel.sql('RANDOM()')) }, dependent: :destroy 
  belongs_to :game

  def deal_to(hand)
    #cards = Card.where(deck: self)
    10.times do
      cards = Card.where(deck: self)
      i = rand(0..cards.count-1)
      card = cards[i] #cards.first
      #byebug
      card.hand = hand
      card.deck = nil
      card.save
    end
  end

  def build_deck
    self.cards.each do |card|
      card.destroy!
    end
    Card.get_cards.each do |card|
      Card.create!(deck: self, name: card)
      Card.create!(deck: self, name: card)
    end
  end

end
