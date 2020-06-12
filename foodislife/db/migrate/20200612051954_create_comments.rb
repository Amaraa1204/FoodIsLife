class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :userId
      t.integer :recipeId
      t.timestamps
    end
  end
end
