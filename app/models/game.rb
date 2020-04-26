class Game #< ActiveRecord::Base
  include ActiveModel::Model
  #has_one :deck


 attr_accessor :deck, :hands, :players

  def initialize()
  #  super
    player_pool = ["Nick Pettit", "Tommy Morgan", "Jason Seifer"]
    player_pool.shuffle!
    players = [player_pool[0], player_pool[1], player_pool[2], "You"]
    initialize_players(players)
    initialize_hands
    @deck = Deck.new
  end

  def start
    @hands.each do |hand|
      @deck.deal_to(hand)
      hand.sort_cards
    end
  end


  def initialize_players(names)
    @players = []
    i = 0
    names.each do |name| 
      @players[i] = name 
      i +=1
    end
  end

  def initialize_hands
    @hands = []
    @players.each do |player| 
      @hands << Hand.new(player) 
    end
  end



end
