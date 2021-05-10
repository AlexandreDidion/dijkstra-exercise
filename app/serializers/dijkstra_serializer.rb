class DijkstraSerializer
  include JSONAPI::Serializer
  
  set_type :dijkstra_path
  set_id { SecureRandom.uuid }
  set_key_transform :dash
  attribute :journey do |city, params|
    params[:path]
  end 
  attribute :distance_km do |city, params|
    params[:distance]
  end
end
