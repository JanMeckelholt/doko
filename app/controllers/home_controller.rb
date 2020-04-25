class HomeController < ApplicationController
   def index

   
    #@game = Game.new()
    #@deck = Deck.new()
    @deck = Deck.new
    @deck_cards = @deck.deck_cards
    @hand1 = Hand.new
    @hand1 = @deck_cards[1]
    

    #@hand1.cards.build(id: @cards[1].id)
    
#byebug

    #@hand1.cards = @cards
    #@hand2 = Hand.new()
    #@hand3 = Hand.new()
    #@hand4 = Hand.new()

    #@card = Card.new(value: 10, suit: "spades")
    #@game.start()

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
