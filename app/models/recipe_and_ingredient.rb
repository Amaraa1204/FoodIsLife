class RecipeAndIngredient < ApplicationRecord
  belongs_to :Recipe, :foreign_key=>'recipeId'
  belongs_to :Ingredient, :foreign_key=>'ingredientId'
end
