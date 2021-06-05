class DijkstraSerializer
  include JSONAPI::Serializer
  
  set_type :dijkstra
  set_id { SecureRandom.uuid }
  set_key_transform :dash
  attribute :journey do |city, params|
    params[:path]
  end 
  attribute :distance_km do |city, params|
    params[:distance]
  end
  attribute :city_start_id do |city, params|
    params[:city_start_id]
  end
  attribute :city_end_id do |city, params|
    params[:city_end_id]
  end 
end
