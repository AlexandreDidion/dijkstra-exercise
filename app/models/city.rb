class City < ApplicationRecord
  belongs_to :country
  has_many :starting_roads, class_name: 'Road', foreign_key: 'city_start_id'
  has_many :ending_roads, class_name: 'Road', foreign_key: 'city_end_id'
  validates :name, presence: true

  def roads
    starting_roads + ending_roads
  end

  def connected_cities
    City.where(id: roads.pluck(:city_start_id, :city_end_id).flatten.uniq - [id])
  end
end
