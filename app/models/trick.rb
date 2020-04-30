class Trick < ActiveRecord::Base
	belongs_to :game
	has_many :cards
end
