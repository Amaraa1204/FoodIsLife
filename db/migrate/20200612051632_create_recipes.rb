class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instruction
      t.decimal :rating
      t.string :image
      t.integer :categoryId
      t.integer :authorId
      t.timestamps
    end
  end
end
