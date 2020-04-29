class AddColumnToHand < ActiveRecord::Migration
  def change
    add_column :hands, :card1, :string
    add_column :hands, :card2, :string
    add_column :hands, :card3, :string
    add_column :hands, :card4, :string
    add_column :hands, :card5, :string
    add_column :hands, :card6, :string
    add_column :hands, :card7, :string
    add_column :hands, :card8, :string
    add_column :hands, :card9, :string
    add_column :hands, :card10, :string
    
  end
end
