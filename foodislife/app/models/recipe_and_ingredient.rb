class RecipeAndIngredient < ApplicationRecord
  belongs_to :Recipe, :foreign_key=>'recipeId'
  belongs_to :Ingredient, :foreign_key=>'ingredientId'
  belongs_to :Unit, :foreign_key=>'unitId'
end
