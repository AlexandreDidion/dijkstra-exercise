puts 'Cleaning database...'

Country.destroy_all
City.destroy_all
Road.destroy_all

puts 'Database Cleaned'

puts 'Creating Country...'
belgium = Country.create(name: 'Belgium')
france = Country.create(name: 'France')

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

lille = City.create(name: 'Lille', country: france)
metz = City.create(name: 'Metz', country: france)
paris = City.create(name: 'Paris', country: france)
dijon = City.create(name: 'Dijon', country: france)
lyon = City.create(name: 'Lyon', country: france)
marseille = City.create(name: 'Marseille', country: france)
toulouse = City.create(name: 'Toulouse', country: france)
bordeaux = City.create(name: 'Bordeaux', country: france)
la_rochelle = City.create(name: 'La Rochelle', country: france)
rennes = City.create(name: 'Rennes', country: france)

puts 'Creating roads...'

bruges_ghent = Road.create(city_start: bruges, city_end: ghent, distance: 50, country: belgium)
ghent_tournai = Road.create(city_start: ghent, city_end: tournai, distance: 80, country: belgium)
tournai_brussels = Road.create(city_start: tournai, city_end: brussels, distance: 89, country: belgium)
ghent_brussels = Road.create(city_start: ghent, city_end: brussels, distance: 56, country: belgium)
ghent_antwerp = Road.create(city_start: ghent, city_end: antwerp, distance: 60, country: belgium)
antwerp_mechelen = Road.create(city_start: antwerp, city_end: mechelen, distance: 25, country: belgium)
mechelen_brussels = Road.create(city_start: mechelen, city_end: brussels, distance: 27, country: belgium)
brussels_mons = Road.create(city_start: brussels, city_end: mons, distance: 80, country: belgium)
mons_namur = Road.create(city_start: mons, city_end: namur, distance: 91, country: belgium)
mons_tournai = Road.create(city_start: mons, city_end: tournai, distance: 51, country: belgium)
namur_arlon = Road.create(city_start: namur, city_end: arlon, distance: 129, country: belgium)
arlon_liege = Road.create(city_start: arlon, city_end: liege, distance: 123, country: belgium)
liege_namur = Road.create(city_start: liege, city_end: namur, distance: 65, country: belgium)
liege_brussels = Road.create(city_start: liege, city_end: brussels, distance: 97, country: belgium)

lille_metz = Road.create(city_start: lille, city_end: metz, distance: 279, country: france)
lille_paris = Road.create(city_start: lille, city_end: paris, distance: 204, country: france)
metz_paris = Road.create(city_start: metz, city_end: paris, distance: 280, country: france)
metz_dijon = Road.create(city_start: metz, city_end: dijon, distance: 217, country: france)
paris_dijon = Road.create(city_start: paris, city_end: dijon, distance: 263, country: france)
paris_rennes = Road.create(city_start: paris, city_end: rennes, distance: 308, country: france)
dijon_lyon = Road.create(city_start: dijon, city_end: lyon, distance: 175, country: france)
lyon_marseille = Road.create(city_start: lyon, city_end: marseille, distance: 277, country: france)
lyon_toulouse = Road.create(city_start: lyon, city_end: toulouse, distance: 360, country: france)
toulouse_marseille = Road.create(city_start: toulouse, city_end: marseille, distance: 319, country: france)
toulouse_bordeaux = Road.create(city_start: toulouse, city_end: bordeaux, distance: 212, country: france)
bordeaux_larochelle = Road.create(city_start: bordeaux, city_end: la_rochelle, distance: 153, country: france)
bordeaux_rennes = Road.create(city_start: bordeaux, city_end: rennes, distance: 373, country: france)
larochelle_rennes = Road.create(city_start: la_rochelle, city_end: rennes, distance: 221, country: france)


puts 'All Done!'




