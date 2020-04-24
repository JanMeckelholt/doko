class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :cards, :value, :string
  end
end
