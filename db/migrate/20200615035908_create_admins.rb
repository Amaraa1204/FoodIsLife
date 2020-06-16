class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :userName
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
