class RoadSerializer
  include JSONAPI::Serializer
  has_many :city_start, serializer: CitySerializer
  has_many :city_end, serializer: CitySerializer
end
