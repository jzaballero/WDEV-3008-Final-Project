class Province < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :PST, :GST, :HST, numericality: true
end