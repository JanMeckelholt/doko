class Card #< ActiveRecord::Base
  include ActiveModel::Model
  #belongs_to :deck
  #belongs_to :hand

  @@suits = [:kreuz, :pik, :herz, :karo]
  @@values = {
      :zehn => 10,
      :bube => 2,
      :dame => 3,
      :koenig => 4,
      :ass => 11
  }
  def initialize(value, suit)
  #  super
    @value = value
    @suit = suit
  end
  
  def value
    @value
  end

  def suit
    @suit
  end

  def numeric_value
    @@values[@value]
  end

  def to_s
    @suit.to_s.capitalize << "_" << @value.to_s.capitalize
  end

  def self.all_suits
    @@suits
  end

  def self.all_values
    @@values
  end


end
