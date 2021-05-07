class CountrySerializer
  include JSONAPI::Serializer
  
  set_type :country
  set_key_transform :dash
  attributes :name

  has_many :cities, meta: Proc.new { |country_record,params| { number_cities: country_record.cities.count } }
  has_many :roads, meta: Proc.new { |country_record,params| { number_roads: country_record.roads.count } }
end
