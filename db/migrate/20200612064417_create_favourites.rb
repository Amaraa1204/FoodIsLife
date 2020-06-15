class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.integer :userId
      t.integer :recipeId

      t.timestamps
    end
  end
end
