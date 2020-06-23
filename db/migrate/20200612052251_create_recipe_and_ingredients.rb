class CreateRecipeAndIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_and_ingredients do |t|
      t.integer :recipeId
      t.integer :ingredientId

      t.timestamps
    end
  end
end
