class Category < ApplicationRecord
  has_many :products, through: :product_categories
  has_many :product_categories

  validates :name, :price_range, presence: true
end
