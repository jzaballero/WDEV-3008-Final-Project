class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.references :province, null: false, foreign_key: true
      t.string :password
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :phone_number

      t.timestamps
    end
  end
end
