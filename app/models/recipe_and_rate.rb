class RecipeAndRate < ApplicationRecord
    belongs_to :Recipe, :foreign_key=>'recipeId'
    belongs_to :User, :foreign_key=>'userId'
end
