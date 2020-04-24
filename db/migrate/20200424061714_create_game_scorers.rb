class CreateGameScorers < ActiveRecord::Migration
  def change
    create_table :game_scorers do |t|

      t.timestamps null: false
    end
  end
end
