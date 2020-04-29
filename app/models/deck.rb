class Deck < ActiveRecord::Base
  #include ActiveModel::Model
  #has_many :cards, -> { order(Arel.sql('RANDOM()')) }, dependent: :destroy 

  enum suit: [:kreuz, :pik, :herz, :karo]
  
  enum value: {
      :zehn => 10,
      :bube => 2,
      :dame => 3,
      :koenig => 4,
      :ass => 11
  }

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


#  @@order = {
#    [:herz, :zehn] => 1,
#    [:kreuz, :dame]=> 2,
#    [:pik, :dame] => 3,
#    [:herz , :dame] => 4,
#    [:karo , :dame] => 5,
#    [:kreuz , :bube] => 6,
#    [:pik , :bube] => 7,
#    [:herz , :bube] => 8,
#    [:karo , :bube] => 9,
#    [:karo , :ass] => 10,
#    [:karo , :zehn] => 11,
#    [:karo , :koenig] => 12,
#    [:kreuz , :ass] => 13,
#    [:kreuz , :zehn] => 14,
#    [:kreuz , :koenig] => 15,
#    [:pik , :ass] => 16,
#    [:pik , :zehn] => 17,
#    [:pik , :koenig] => 18,
#    [:herz , :ass] => 19,
#    [:herz , :koenig] => 20
#  }



  def Deck.order_value(card)
    CARDS.find_index(card)
    #byebug
  end



  def deal_to(hand)
    hand.card1 = @deck_cards.pop
    hand.card2 = @deck_cards.pop
    hand.card3 = @deck_cards.pop
    hand.card4 = @deck_cards.pop
    hand.card5 = @deck_cards.pop
    hand.card6 = @deck_cards.pop
    hand.card7 = @deck_cards.pop
    hand.card8 = @deck_cards.pop
    hand.card9 = @deck_cards.pop
    hand.card10 = @deck_cards.pop
  end

  def build_deck
    @deck_cards = CARDS
    @deck_cards += @deck_cards
    @deck_cards.shuffle!
  end

end
