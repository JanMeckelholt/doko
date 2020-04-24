class Game < ActiveRecord::Base
  has_one :deck


 #attr_reader :deck, :hands, :players

  #def initialize()
  #  super
  #  player_pool = ["Nick Pettit", "Amit Bijlani", "Chris Michel", "Tommy Morgan", "Jason Seifer"]
  #  player_pool.shuffle!
  #  players = [player_pool[0], player_pool[1], player_pool[2], player_pool[3], "You"]
  #  initialize_players(players)
  #  initialize_hands
  #  @deck = Deck.new
  #end

  def start
   #5.times {@hands.each {|hand| @deck.deal_to hand}}
    #@deck = Deck.new()
    #@deck.build_deck()
  end

  private
  def initialize_players(names)
    @players = Hash.new(0)
    names.each { |name| @players[SecureRandom.uuid] = name }
  end

  def initialize_hands
    @hands = []
    @players.keys.each {|player| @hands << Hand.new(player) }
  end



end
