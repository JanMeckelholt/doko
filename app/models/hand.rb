class Hand < ActiveRecord::Base
#  include ActiveModel::Model
#has_many :cards
belongs_to_one :player

  attr_accessor :hand_cards

  def initialize
    @hand_cards = []
  end

  def add_card(card)
    @hand_cards << card
  end

  def play_card(card)
    @hand_cards.delete(card)
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




  

end
