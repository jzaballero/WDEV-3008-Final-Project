# frozen_string_literal: true

# Remove column "images" from products table
class RemoveImageToProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :image, :string
  end
end
