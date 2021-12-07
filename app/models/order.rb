# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :status

  has_many :products, through: :product_orders
  has_many :product_orders

  validates :PST_total, :GST_total, :HST_total, numericality: true
  validates :subtotal, presence: true, numericality: true
end
