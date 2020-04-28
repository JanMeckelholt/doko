class Hand < ActiveRecord::Base
  #include ActiveModel::Model
  has_many :cards   #, -> { order(order_value) }  
  belongs_to :player


  #attr_accessor :hand_cards

  #def initialize(player)
  #  @hand_cards = []
  #end

  #def add_card(card)
  #  @hand_cards << card
  #end

  #def play_card(card)
  #  @hand_cards.delete(card)
  #end

  #def hand_cards
  #  @hand_cards
  #end


  def sort_cards
    #@hand_cards.sort! { |a, b| a.numeric_value <=> b.numeric_value }
  #  byebug
    cards = self.cards
    cards.sort_by! { |a| a.order_value  }
    cards
  end





  private




  

end
