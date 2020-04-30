class HomeController < ApplicationController
before_action :authenticate_player!


   def index
    @current_player = current_player
    @game = Game.all.first || Game.create!
    find_players 
  end #index

  def join_game
    @current_player = current_player
   # byebug
    @game = Game.all.first || Game.create!
    @game_player = GamePlayer.find_or_create_by!(game: @game, player: @current_player)
    redirect_to :home_index
  end



  def play
    @current_player = current_player
    if GamePlayer.find_by(player: @current_player)
      @game = GamePlayer.find_by(player: @current_player).game
      find_players
    else 
      redirect_to :home_index
    end
  end #play

  def create_game
    if params[:game]
      @game = Game.find(params[:game])
    end
    if @game
      @game.destroy!
    end
    @game = Game.all.first || Game.create!
    
    @current_player = current_player

    
    @players = []
    params[:players].each do |player_id|
      @players << Player.find(player_id)
    end
    @players.each do |player|
      @game_player = GamePlayer.create!(game: @game, player: player)
    end
    @deck = Deck.create!(game: @game)
    @deck.build_deck
    init_players
    @trick = Trick.create!(game: @game)
    redirect_to :home_play
  end #create


private
  
  def find_players
    @players = []
    @game_players = GamePlayer.where(game_id: @game.id) || []
    @game_players.each do |game_player|
      @players << game_player.player
    end  
  end #find_players

  def init_players
    @players.each do |player|
      #hand = Hand.new(player: player)
      hand = Hand.find_or_create_by!(player: player)
      @deck.deal_to(hand)
      hand.save
      player.save
    end
      #@deck.deal(@players[0].hand, @players[0].hand, @players[0].hand, @players[0].hand)
      #hand = hand.sort_cards
      #hand.save
      #player.save
      #byebug
    #@game.deck.destroy!
  end #init_players



end
