# frozen_string_literal: true

# Create categories table
class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :price_range

      t.timestamps
    end
  end
end
