class CreateRecipeAndIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_and_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.timestamps
    end
  end
end
