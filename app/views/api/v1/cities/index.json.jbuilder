json.array! @cities do |city|
  json.extract! city, :id, :name, :country
end
