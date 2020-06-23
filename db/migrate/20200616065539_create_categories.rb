class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories, :id => false  do |t|
      t.string :name

      t.timestamps
    end
    add_index :categories, :categoryId
  end
end
