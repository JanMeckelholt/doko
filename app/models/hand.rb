class Hand #< ActiveRecord::Base
  include ActiveModel::Model
#has_many :cards

  attr_accessor :hand_cards

  def initialize(id=0)
    @id = id
    @hand_cards = []
  end

  def add_card(card)
    @hand_cards << card
  end

  #def hand_cards
  #  @hand_cards
  #end


  def sort_cards
    #@hand_cards.sort! { |a, b| a.numeric_value <=> b.numeric_value }
  #  byebug
    @hand_cards.sort_by! { |a| a.order_value  }
  
  end





  private
  def card_suits
    @cards.map { |card| card.suit }
  end

  def card_values
    @cards.map { |card| card.value }
  end

  def get_rank
    find_pairs
    # A straight from a ten to an ace with all five cards of the same suit. In poker all suits are ranked equally.
    return :royal_flush if is_flush? && has_all_royal_values?
    # Any straight with all five cards of the same suit.
    return :straight_flush if is_flush? && is_straight?
    # Any four cards of the same rank. If two players share the same Four of a Kind (on the board), the bigger fifth card (the "kicker") decides who wins the pot.
    return :four_of_a_kind if has_four_of_a_kind?
    # Any three cards of the same rank together with any two cards of the same rank. Our example shows "Aces full of Kings" and it is a bigger full house than "Kings full of Aces."
    return :full_house if is_full_house?
    # Any five cards of the same suit (not consecutive). The highest card of the five determines the rank of the flush. Our example shows an Ace-high flush, which is the highest possible.
    return :flush if is_flush?
    # Any five consecutive cards of different suits. Aces can count as either a high or a low card. Our example shows a five-high straight, which is the lowest possible straight.
    return :straight if is_straight? || is_sucker_straight?
    # Any three cards of the same rank. Our example shows three-of-a-kind Aces, with a King and a Queen as side cards - the best possible three of a kind.
    return :three_of_a_kind if has_three_of_a_kind?
    # Any two cards of the same rank together with another two cards of the same rank. Our example shows the best possible two-pair, Aces and Kings. The highest pair of the two determines the rank of the two-pair.
    return :two_pair if has_two_pair?
    # Any two cards of the same rank. Our example shows the best possible one-pair hand.
    return :one_pair if has_pair?
    # Any hand not in the above-mentioned hands. Our example shows the best possible high-card hand.
    :high_card
  end


  

end
