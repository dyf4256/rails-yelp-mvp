class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, presence: true
  validates :category, acceptance: { accept: %w[chinese italian japanese french belgian] }
end
