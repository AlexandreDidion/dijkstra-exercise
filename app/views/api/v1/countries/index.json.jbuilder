json.array! @countries do |country|
  json.extract! country, :id, :name
end
