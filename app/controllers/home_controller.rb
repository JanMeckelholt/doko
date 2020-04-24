class HomeController < ApplicationController
   def index

   
    @game = Game.new()
    @deck = Deck.new()
    @deck.build_deck()
    #@card = Card.new(value: 10, suit: "spades")
    @game.start()

    #byebug
    
   # @game.start
   # scorer = GameScorer.new(@game)
   # session[:the_game] = @game
   # session[:the_score] = scorer
  end
  def play
    #@scorer = session[:the_score]
    #@game = session[:the_game]
  end





end
