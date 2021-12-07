class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :product_orders

  has_many :categories, through: :product_categories
  has_many :orders, through: :product_orders

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, :pokemon_number, numericality: true
  validates :pokemon_name, :pokemon_type, length: { minimum: 2, maximum: 128 }
end
