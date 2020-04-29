class HomeController < ApplicationController
before_action :authenticate_player!


   def index
    @current_player = current_player
    if !@game
      @game = Game.first || Game.create!
    end

    if params[:game]
      @game = Game.find(params[:game])
      @game_player = GamePlayer.find_or_create_by!(game: @game, player: @current_player)
    end
   # byebug
    find_players
    #@players = []
    #@game_players = GamePlayer.where(game_id: @game.id) || []
    #@game_players.each do |game_player|
    #  @players << game_player.player
    #end

   # scorer = GameScorer.new(@game)
   # session[:players] = @players
   # session[:the_score] = scorer
  end


  def play
    @current_player = current_player
    if GamePlayer.find_by(player: @current_player)
      @game = GamePlayer.find_by(player: @current_player).game
    end
    
    if @game
      find_players
      @deck = Deck.new
      @deck.build_deck
      init_players

      #@game.initialize_hands(@players)
      #@hands = @game.hands
      
    else 
      redirect_to :home_index
    end

  end


private
  
  def find_players
    @players = []
    @game_players = GamePlayer.where(game_id: @game.id) || []
    @game_players.each do |game_player|
      @players << game_player.player
    end  
  end

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
  end



end
