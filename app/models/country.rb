class Country < ApplicationRecord
  has_many :cities, dependent: :destroy
  has_many :roads, dependent: :destroy
  validates :name, presence: true
end
