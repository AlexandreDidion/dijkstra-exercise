class CitySerializer
  include JSONAPI::Serializer
  set_type :city
  set_key_transform :dash
  attribute :name, :latitude, :longitude

  belongs_to :country, meta: Proc.new { |city_record| { country_name: city_record.country.name } }
  has_many :starting_roads, serializer: RoadSerializer
  has_many :ending_roads, serializer: RoadSerializer
end
