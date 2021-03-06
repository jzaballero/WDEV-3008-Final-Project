# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  validates :name, :price_range, presence: true
end
