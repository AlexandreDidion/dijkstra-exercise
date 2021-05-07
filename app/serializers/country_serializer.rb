class CountrySerializer
  include JSONAPI::Serializer
  
  set_type :country
  set_key_transform :dash
  attributes :name

  has_many :cities
  has_many :roads
end
