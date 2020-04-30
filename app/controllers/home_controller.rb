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
      destroy_player_hands
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
    @deck = @game.deck || Deck.create!(game: @game)
    @deck.build_deck
    init_players
    @trick = Trick.create!(game: @game)
    redirect_to :home_play
  end #create

  def play_card
    @card = Card.find(params[:card])
    @current_player = current_player
    @game = Game.find(params[:game])
    if @current_player.hand.cards.count + @game.round == 10
      @card.trick = @game.trick
      @card.hand = nil
      @card.save
    end
    #byebug
    redirect_to :home_play
  end



private


  
  def find_players
    @players = []
    @player_ids = GamePlayer.where(game_id: @game.id).distinct.pluck(:player_id) || []
    @player_ids.each do |player_id|
      @players << Player.find(player_id)
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
  end #init_players

  def destroy_player_hands
    find_players
    @players.each do |player|
      player.hand.destroy!
    end
  end

end
