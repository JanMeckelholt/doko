class AddValueToCard < ActiveRecord::Migration
  def change
    add_column :cards, :value, :integer
    add_column :cards, :suit, :string
  end
end
