class AddGameToDeck < ActiveRecord::Migration
  def change
    add_reference :decks, :game, index: true, foreign_key: true
  end
end
