class Road < ApplicationRecord
  has_many :connections, dependent: :destroy
  belongs_to :city_start, class_name: 'City'
  belongs_to :city_end, class_name: 'City'
  has_many :cites, through: :connections
end
