class DropScorers < ActiveRecord::Migration
  def change
  	drop_table :game_scorers
  end
end
