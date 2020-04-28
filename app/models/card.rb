class Card < ActiveRecord::Base
  #include ActiveModel::Model
  belongs_to :deck
  belongs_to :hand

#  enum status: [:published, :unpublished, :not_set]
  enum suits: [:kreuz, :pik, :herz, :karo]
  
  enum values: {
      :zehn => 10,
      :bube => 2,
      :dame => 3,
      :koenig => 4,
      :ass => 11
  }

  @@order = {
    [:herz, :zehn] => 1,
    [:kreuz, :dame]=> 2,
    [:pik, :dame] => 3,
    [:herz , :dame] => 4,
    [:karo , :dame] => 5,
    [:kreuz , :bube] => 6,
    [:pik , :bube] => 7,
    [:herz , :bube] => 8,
    [:karo , :bube] => 9,
    [:karo , :ass] => 10,
    [:karo , :zehn] => 11,
    [:karo , :koenig] => 12,
    [:kreuz , :ass] => 13,
    [:kreuz , :zehn] => 14,
    [:kreuz , :koenig] => 15,
    [:pik , :ass] => 16,
    [:pik , :zehn] => 17,
    [:pik , :koenig] => 18,
    [:herz , :ass] => 19,
    [:herz , :koenig] => 20
  }



#  def initialize(value, suit)
  #  super
#    @value = value
#    @suit = suit
#  end
  
  #def value
  #  @value
  #end

  #def suit
  #  @suit
  #end

  def numeric_value
    @@values[@value]
  end

  def order_value
    @@order[[@suit, @value]]
  end

  def to_s
    self.suit.to_s.capitalize << "_" << self.value.to_s.capitalize
  end

  #def self.all_suits
  #  self.suits
  #end

  #def self.all_values
  #  self.values
  #end




end
