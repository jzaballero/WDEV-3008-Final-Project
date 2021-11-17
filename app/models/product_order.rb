class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validates :price, presence: true, numericality: true
end
