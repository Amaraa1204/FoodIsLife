class Favourite < ApplicationRecord
	belongs_to :User, :foreign_key=>'userId'
	belongs_to :Recipe, :foreign_key=>'recipeId'
end
