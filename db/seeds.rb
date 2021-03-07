puts 'Cleaning database...'

Country.destroy_all
City.destroy_all
Road.destroy_all

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

bruges_ghent = Road.create(city_start: bruges, city_end: ghent, distance: 50)
ghent_tournai = Road.create(city_start: ghent, city_end: tournai, distance: 80)
tournai_brussels = Road.create(city_start: tournai, city_end: brussels, distance: 89)
ghent_brussels = Road.create(city_start: ghent, city_end: brussels, distance: 56)
ghent_antwerp = Road.create(city_start: ghent, city_end: antwerp, distance: 60)
antwerp_mechelen = Road.create(city_start: antwerp, city_end: mechelen, distance: 25)
mechelen_brussels = Road.create(city_start: mechelen, city_end: brussels, distance: 27)
brussels_mons = Road.create(city_start: brussels, city_end: mons, distance: 80)
mons_namur = Road.create(city_start: mons, city_end: namur, distance: 91)
mons_tournai = Road.create(city_start: mons, city_end: tournai, distance: 51)
namur_arlon = Road.create(city_start: namur, city_end: arlon, distance: 129)
arlon_liege = Road.create(city_start: arlon, city_end: liege, distance: 123)
liege_namur = Road.create(city_start: liege, city_end: namur, distance: 65)
liege_brussels = Road.create(city_start: liege, city_end: brussels, distance: 97)

puts 'All Done!'




