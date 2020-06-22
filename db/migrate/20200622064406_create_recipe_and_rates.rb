class CreateRecipeAndRates < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_and_rates do |t|
      t.integer :recipeId
      t.decimal :rate
      t.integer :userId

      t.timestamps
    end
  end
end
