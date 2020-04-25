class Card #< ActiveRecord::Base
  include ActiveModel::Model
  #belongs_to :deck
  #belongs_to :hand

  @@suits = [:kreuz, :pick, :herz, :karo]
  @@values = {
      :zehn => 10,
      :bube => 11,
      :dame => 12,
      :koenig => 13,
      :ass => 14
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
    @suit.to_s.capitalize << " " << @value.to_s.capitalize
  end

  def self.all_suits
    @@suits
  end

  def self.all_values
    @@values
  end


end
