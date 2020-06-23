class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instruction
      t.decimal :rating
      t.string :image
      t.string :rec_category_id
      t.integer :author_id
      t.timestamps
    end
  end
end
