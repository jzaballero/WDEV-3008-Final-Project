class ProductOrder < ApplicationRecord
  belongs_to :product, dependent: :destroy
  belongs_to :order, dependent: :destroy

  validates :quantity, presence: true
  validates :price, presence: true, numericality: true
end
