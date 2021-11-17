class Product < ApplicationRecord
  has_many :categories, through: :product_categories
  has_many :orders, through: :product_orders

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, :pokemon_number, numericality: true
  validates :image, :pokemon_name, :pokemon_type, length: { minimum: 2, maximum: 128 }
end
