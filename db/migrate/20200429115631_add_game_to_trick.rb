class AddGameToTrick < ActiveRecord::Migration
  def change
    add_reference :tricks, :game, index: true, foreign_key: true
  end
end
