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

    @players = []
    @game_players = GamePlayer.where(game_id: @game.id) || []
    @game_players.each do |game_player|
      @players << game_player.player
    end

   # scorer = GameScorer.new(@game)
   # session[:players] = @players
   # session[:the_score] = scorer
  end


  def play
    @current_player = current_player
    @game = @current_player.game
    if @game
      @players = @game.players.all
    else 
      redirect_to :index
    end

    if !@game   
      @game = Game.new()
      #@game.set_players(@players[0], @players[1], @players[2], @players[3])
      @game.initialize_hands
      @hands = @game.hands
      @game.start()
    end
  end







end
