class CreateRecipeAndRates < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_and_rates do |t|
      t.integer :recipe_id
      t.decimal :rate
      t.integer :user_id

      t.timestamps
    end
  end
end
