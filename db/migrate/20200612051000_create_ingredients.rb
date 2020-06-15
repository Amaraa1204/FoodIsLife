class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :calories
      t.integer :categoryId

      t.timestamps
    end
  end
end
