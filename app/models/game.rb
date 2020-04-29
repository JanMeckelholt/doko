class Game < ActiveRecord::Base
  #include ActiveModel::Model
  #has_one :deck

  belongs_to :player
  has_many :game_players
  has_many :players, :through => :game_players, :source => :player





 #attr_accessor :deck #, :hands, :players

  #def initialize
 
    #player_pool = ["Nick Pettit", "Tommy Morgan", "Jason Seifer"]
   #player_pool.shuffle!
   # players = [player_pool[0], player_pool[1], player_pool[2], "You"]
   # initialize_players(players)
    #@players=[player1, player2, player3, player4]
    #initialize_hands
    #byebug
   # @deck = Deck.new
  #end

  #def start
  #  @deck = Deck.create!
  #  @deck.build_deck
  #  @deck.shuffle
  #  @deck.save
    #self.players each do |player|
    #  @deck.deal_to(player.hand)

    #@hands.each do |hand|
    #  @deck.deal_to(hand)
    #  hand.sort_cards
    #end
  #end

  #def set_players(player1=nil, player2=nil, player3=nil, player4=nil)
  #  @players = []
  #  if player1
  #   @players[0]=player1
  #  end
  #  if player2
  #    @players[1]=player2
  #  end
  #  if player3
  #    @players[2]=player3
  #  end
  #  if player4
  #    @players[3]=player4
  #  end
  #end

  #def initialize_players(names)
  #  @players = []
  #  i = 0
  #  names.each do |name| 
  #    @players[i] = name 
  #    i +=1
  #  end
  #end

#  def initialize_hands(players)
#    @hands = []
#    players.each do |player| 
#      @hands << Hand.find_or_create_by!(player: player) 
#    end
#  end



end
