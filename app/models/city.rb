class City < ApplicationRecord
  belongs_to :country
  has_many :connections, dependent: :destroy
  has_many :roads, through: :connections

  validates :name, presence: true
end
