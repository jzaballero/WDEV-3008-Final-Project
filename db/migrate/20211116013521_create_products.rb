class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image
      t.string :pokemon_name
      t.string :pokemon_type
      t.integer :pokemon_number

      t.timestamps
    end
  end
end
