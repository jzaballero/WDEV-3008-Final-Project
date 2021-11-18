class Category < ApplicationRecord
  has_many :products, through: :product_categories
  has_many :product_categories

  validates :name, presence: true
  validates :price_range, presence: true, numericality: true
end
