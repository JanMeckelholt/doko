class Deck < ActiveRecord::Base
  #include ActiveModel::Model
  has_many :cards, -> { order(Arel.sql('RANDOM()')) }, dependent: :destroy 

  #attr_accessor :deck_cards
#  attr_reader :cards

  #def initialize
    #super
  #  build_deck
  #  shuffle
    # byebug
  #end

  def shuffle
    @deck_cards.shuffle!
  end

  def deal_to(hand)
    #cards = self.cards
    hand.cards = []
    10.times do 

      card = self.cards.first#@deck_cards.pop()
      hand.cards << card  # add_card(card) #.cards.build(value: card.value, suit: card.suit)
      card.deck=nil
      card.save
    end
    hand
#byebug
  end

  def deck_is_empty?
    @cards.length == 0
  end


  def build_deck
    @deck_cards = []
    Card.values.keys.each do |value|
      Card.suits.each do|suit| 
        card = Card.create!(value: value, suit: suit[0], deck: self)#, deck:self)
        card = Card.create!(value: value, suit: suit[0], deck: self)
        #@deck_cards << card
        #@deck_cards << card

        #byebug
      end
    end
  end

end
