# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :province
  has_many :orders

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :address, :city, :postal_code, :phone_number, presence: true
end
