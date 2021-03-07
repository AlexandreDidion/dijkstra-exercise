class Road < ApplicationRecord
  belongs_to :city_start, class_name: 'City'
  belongs_to :city_end, class_name: 'City'

  def name
    "#{city_start.name} - #{city_end.name}"
  end
end
