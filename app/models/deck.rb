class Deck < ActiveRecord::Base
  has_many :cards

  attr_reader :deck_cards
#  attr_reader :cards

  def initialize
    super
    build_deck
    shuffle
    # byebug
  end

  def shuffle
    @deck_cards.shuffle!
  end

  def deal_to(hand)
    card = @cards.pop()
    hand.cards.create(value: card.value, suit: card.suit)
  end

  def deck_is_empty?
    @cards.length == 0
  end

  private
  def build_deck
    @deck_cards = []
    Card.all_values.keys.each do |value|
      Card.all_suits.each do|suit| 
        card = Card.new(value: value, suit: suit, deck:self)
        @deck_cards << card
        #byebug
      end
    end
  end

end
