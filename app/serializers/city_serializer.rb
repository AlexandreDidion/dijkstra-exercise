class CitySerializer
  include JSONAPI::Serializer
  set_type :city
  set_key_transform :dash
  attribute :name

  belongs_to :country, meta: Proc.new { |city_record| { country_name: city_record.country.name } }
end
