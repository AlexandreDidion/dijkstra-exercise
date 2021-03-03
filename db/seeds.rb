puts 'Cleaning database...'

Country.destroy_all
City.destroy_all
Road.destroy_all
Connection.destroy_all

puts 'Database Cleaned'

puts 'Creating Country...'
belgium = Country.create(name: 'Belgium')

puts 'Creating cities...'

brussels = City.create(name: 'Brussels', country: belgium)
bruges = City.create(name: 'Bruges', country: belgium)
antwerp = City.create(name: 'Antwerp', country: belgium)
ghent = City.create(name: 'Ghent', country: belgium)
tournai = City.create(name: 'Tournai', country: belgium)
namur = City.create(name: 'Namur', country: belgium)
liege = City.create(name: 'Liège', country: belgium)
mons = City.create(name: 'Mons', country: belgium)
arlon = City.create(name: 'Arlon', country: belgium)
mechelen = City.create(name: 'Mechelen', country: belgium)

puts 'Creating roads...'

road_1 = Road.create(city_start: bruges, city_end: ghent, distance: 50)
road_2 = Road.create(city_start: ghent, city_end: tournai, distance: 80)
road_3 = Road.create(city_start: tournai, city_end: brussels, distance: 89)
road_4 = Road.create(city_start: ghent, city_end: brussels, distance: 56)
road_5 = Road.create(city_start: ghent, city_end: antwerp, distance: 60)
road_6 = Road.create(city_start: antwerp, city_end: mechelen, distance: 25)
road_7 = Road.create(city_start: mechelen, city_end: brussels, distance: 27)
road_8 = Road.create(city_start: brussels, city_end: mons, distance: 80)
road_9 = Road.create(city_start: mons, city_end: namur, distance: 91)
road_10 = Road.create(city_start: mons, city_end: tournai, distance: 51)
road_11 = Road.create(city_start: namur, city_end: arlon, distance: 129)
road_12 = Road.create(city_start: arlon, city_end: liege, distance: 123)
road_13 = Road.create(city_start: liege, city_end: namur, distance: 65)
road_14 = Road.create(city_start: liege, city_end: brussels, distance: 97)

puts 'Making all the connections...'

Connection.create(city: brussels, road: road_3)
Connection.create(city: brussels, road: road_7)
Connection.create(city: brussels, road: road_8)
Connection.create(city: brussels, road: road_14)
Connection.create(city: bruges, road: road_1)
Connection.create(city: ghent, road: road_1)
Connection.create(city: ghent, road: road_2)
Connection.create(city: ghent, road: road_4)
Connection.create(city: ghent, road: road_5)
Connection.create(city: tournai, road: road_2)
Connection.create(city: tournai, road: road_3)
Connection.create(city: tournai, road: road_10)
Connection.create(city: antwerp, road: road_5)
Connection.create(city: antwerp, road: road_6)
Connection.create(city: mechelen, road: road_6)
Connection.create(city: mechelen, road: road_7)
Connection.create(city: mons, road: road_8)
Connection.create(city: mons, road: road_9)
Connection.create(city: mons, road: road_10)
Connection.create(city: namur, road: road_9)
Connection.create(city: namur, road: road_11)
Connection.create(city: namur, road: road_13)
Connection.create(city: arlon, road: road_11)
Connection.create(city: arlon, road: road_12)
Connection.create(city: liege, road: road_12)
Connection.create(city: liege, road: road_13)
Connection.create(city: liege, road: road_14)

puts 'All Done!'







