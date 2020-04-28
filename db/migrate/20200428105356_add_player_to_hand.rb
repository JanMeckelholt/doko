class AddPlayerToHand < ActiveRecord::Migration
  def change
    add_reference :hands, :player, index: true, foreign_key: true
  end
end
