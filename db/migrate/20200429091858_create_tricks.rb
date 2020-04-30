class CreateTricks < ActiveRecord::Migration
  def change
    create_table :tricks do |t|
      t.string :card1
      t.string :card2
      t.string :card3
      t.string :card4
      t.integer :next

      t.timestamps null: false
    end
  end
end
