class AddNextPlayerToGame < ActiveRecord::Migration
  def change
    add_column :games, :next_player, :integer, :default => 1
  end
end
