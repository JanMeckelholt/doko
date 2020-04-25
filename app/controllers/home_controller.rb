class HomeController < ApplicationController
   def index

   
    @game = Game.new()
    @game.start()

    @deck_cards = @game.deck.deck_cards
    @hands = @game.hands
    @players = @game.players
    
    @hand1 = @hands[0]
    @player1 = @players[0]

    @hand2 = @hands[1]
    @player2 = @players[1]

    @hand3 = @hands[2]
    @player3 = @players[2]

    @hand4 = @hands[3]
    @player4 = @players[3]


   # scorer = GameScorer.new(@game)
   # session[:the_game] = @game
   # session[:the_score] = scorer
  end
  def play
    #@scorer = session[:the_score]
    #@game = session[:the_game]
  end





end
