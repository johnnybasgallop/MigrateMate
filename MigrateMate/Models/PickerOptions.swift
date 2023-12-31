//
//  PickerOptions.swift
//  MigrateMate
//
//  Created by johnny basgallop on 13/12/2023.
//

import Foundation

let countries = [
    "Argentina", "Australia", "Brazil", "Canada", "China", "France", "Germany", "India", "Italy", "Japan",
    "Mexico", "Netherlands", "New Zealand", "Norway", "Portugal", "Russia", "Singapore", "South Africa", "South Korea", "Spain",
    "Sweden", "Switzerland", "Turkey", "United Kingdom", "United States"
]

let citiesByCountry: [String: [String]] = [
    "Argentina": ["Buenos Aires", "Cordoba", "Rosario", "Mendoza", "San Miguel de Tucuman", "La Plata", "Mar del Plata", "Quilmes", "Salta", "Santa Fe", "San Juan", "Resistencia", "Neuquen", "Corrientes", "Posadas"],
       "Australia": ["Sydney", "Melbourne", "Brisbane", "Perth", "Adelaide", "Gold Coast", "Newcastle", "Canberra", "Wollongong", "Sunshine Coast", "Hobart", "Geelong", "Townsville", "Cairns", "Darwin"],
       "Brazil": ["Sao Paulo", "Rio de Janeiro", "Brasilia", "Salvador", "Fortaleza", "Belo Horizonte", "Manaus", "Curitiba", "Recife", "Porto Alegre", "Goiania", "Guarulhos", "Campinas", "Nova Iguacu", "Sao Luis"],
       "Canada": ["Toronto", "Montreal", "Vancouver", "Calgary", "Edmonton", "Ottawa", "Quebec City", "Winnipeg", "Hamilton", "London", "Halifax", "Victoria", "Windsor", "Oshawa", "Saskatoon"],
       "China": ["Shanghai", "Beijing", "Guangzhou", "Shenzhen", "Chongqing", "Tianjin", "Wuhan", "Dongguan", "Hangzhou", "Nanjing", "Chengdu", "Shenyang", "Xi'an", "Harbin", "Suzhou"],
       "France": ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Strasbourg", "Montpellier", "Bordeaux", "Lille", "Rennes", "Reims", "Saint-Etienne", "Toulon", "Grenoble"],
       "Germany": ["Berlin", "Hamburg", "Munich", "Cologne", "Frankfurt", "Stuttgart", "Dusseldorf", "Dortmund", "Essen", "Leipzig", "Bremen", "Dresden", "Hanover", "Nuremberg", "Duisburg"],
       "India": ["Mumbai", "Delhi", "Bangalore", "Chennai", "Kolkata", "Hyderabad", "Pune", "Ahmedabad", "Jaipur", "Surat", "Lucknow", "Kanpur", "Nagpur", "Indore", "Thane"],
       "Italy": ["Rome", "Milan", "Naples", "Turin", "Palermo", "Genoa", "Bologna", "Florence", "Bari", "Catania", "Venice", "Verona", "Messina", "Padua", "Trieste"],
       "Japan": ["Tokyo", "Yokohama", "Osaka", "Nagoya", "Sapporo", "Fukuoka", "Kawasaki", "Saitama", "Hiroshima", "Sendai", "Chiba", "Kitakyushu", "Sakai", "Shizuoka", "Niigata"],
       "Mexico": ["Mexico City", "Guadalajara", "Monterrey", "Puebla", "Tijuana", "Ecatepec", "Leon", "Gustavo A. Madero", "Juarez", "Zapopan", "Chihuahua", "Naucalpan", "Merida", "Tlalnepantla", "Aguascalientes"],
       "Netherlands": ["Amsterdam", "Rotterdam", "The Hague", "Utrecht", "Eindhoven", "Tilburg", "Groningen", "Almere", "Breda", "Nijmegen", "Apeldoorn", "Haarlem", "Arnhem", "Zaanstad", "Amersfoort"],
       "New Zealand": ["Auckland", "Wellington", "Christchurch", "Hamilton", "Tauranga", "Dunedin", "Palmerston North", "Napier-Hastings", "Nelson", "Rotorua", "Whangarei", "New Plymouth", "Invercargill", "Whanganui", "Gisborne"],
       "Norway": ["Oslo", "Bergen", "Stavanger", "Trondheim", "Drammen", "Fredrikstad", "Kristiansand", "Sandnes", "Tromso", "Sarpsborg", "Skien", "Alesund", "Sandefjord", "Haugesund", "Molde"],
       "Portugal": ["Lisbon", "Porto", "Amadora", "Braga", "Coimbra", "Funchal", "Setubal", "Portimao", "Queluz", "Aveiro", "Evora", "Faro", "Beja", "Guarda", "Leiria"],
       "Russia": ["Moscow", "Saint Petersburg", "Novosibirsk", "Yekaterinburg", "Nizhny Novgorod", "Kazan", "Chelyabinsk", "Omsk", "Samara", "Rostov-on-Don", "Ufa", "Krasnoyarsk", "Voronezh", "Perm", "Volgograd"],
       "Singapore": ["Singapore City", "Jurong", "Tampines", "Woodlands", "Changi", "Hougang", "Yishun", "Bukit Batok", "Choa Chu Kang", "Ang Mo Kio", "Pasir Ris", "Sengkang", "Kallang", "Toa Payoh", "Queenstown"],
       "South Africa": ["Johannesburg", "Cape Town", "Durban", "Pretoria", "Port Elizabeth", "Bloemfontein", "East London", "Polokwane", "Nelspruit", "Kimberley", "Mahikeng", "Pietermaritzburg", "Middelburg", "Kroonstad", "Rustenburg"],
       "South Korea": ["Seoul", "Busan", "Incheon", "Daegu", "Daejeon", "Gwangju", "Suwon", "Ulsan", "Bucheon", "Seongnam", "Goyang", "Cheongju", "Ansan", "Jeonju", "Anyang"],
       "Spain": ["Madrid", "Barcelona", "Valencia", "Seville", "Zaragoza", "Malaga", "Murcia", "Palma de Mallorca", "Las Palmas", "Bilbao", "Alicante", "Cordoba", "Valladolid", "Vigo", "Gijon"],
       "Sweden": ["Stockholm", "Gothenburg", "Malmo", "Uppsala", "Linkoping", "Vasteras", "Orebro", "Norrkoping", "Helsingborg", "Jonkoping", "Umea", "Lund", "Boras", "Sundsvall", "Gavle"],
       "Switzerland": ["Zurich", "Geneva", "Basel", "Bern", "Lausanne", "Lucerne", "St. Gallen", "Lugano", "Biel/Bienne", "Thun", "Köniz", "La Chaux-de-Fonds", "Fribourg", "Schaffhausen", "Vernier"],
       "Turkey": ["Istanbul", "Ankara", "Izmir", "Bursa", "Adana", "Gaziantep", "Konya", "Antalya", "Kayseri", "Eskisehir", "Diyarbakir", "Samsun", "Denizli", "Sanliurfa", "Adapazari"],
    "United Kingdom": [
      "Aberdeen", "Aylesbury", "Basingstoke", "Belfast", "Birmingham", "Blackpool", "Bognor Regis", "Bournemouth", "Bracknell", "Bradford",
      "Bridgend", "Brighton", "Bristol", "Bury St Edmunds", "Cambridge", "Cardiff", "Chelmsford", "Cheltenham", "Chester", "Colchester",
      "Coventry", "Crawley", "Derby", "Derry", "Doncaster", "Dunfermline", "East Kilbride", "Eastbourne", "Edinburgh", "Exeter",
      "Falkirk", "Glasgow", "Gloucester", "Guildford", "Harrogate", "Hemel Hempstead", "High Wycombe", "Huddersfield", "Inverness", "Ipswich",
      "Kettering", "Lancaster", "Leamington Spa", "Leeds", "Leicester", "Lincoln", "Liverpool", "London", "Luton", "Madison",
      "Maidstone", "Manchester", "Middlesbrough", "Milton Keynes", "Newcastle upon Tyne", "Newport", "Northampton", "Norwich", "Nottingham",
      "Oldham", "Oxford", "Peterborough", "Plymouth", "Portsmouth", "Preston", "Reading", "Redditch", "Rochester", "Rotherham",
      "Slough", "Solihull", "Southampton", "Southport", "St Albans", "Stoke-on-Trent", "Sunderland", "Swansea", "Telford",
      "Wakefield", "Warrington", "Watford", "Weymouth", "Wigan", "Wolverhampton", "Worcester", "Worthing", "York"
    ],
    "United States": [
      "Albuquerque", "Anaheim", "Anchorage", "Arlington", "Atlanta", "Aurora", "Austin", "Bakersfield", "Baltimore", "Baton Rouge",
      "Birmingham", "Boise", "Boston", "Bridgeport", "Buffalo", "Charleston", "Charlotte", "Chicago", "Cincinnati", "Cleveland",
      "Colorado Springs", "Columbus", "Dallas", "Denver", "Detroit", "Durham", "El Paso", "Fort Wayne", "Fort Worth", "Fresno",
      "Garland", "Glendale", "Greensboro", "Hialeah", "Honolulu", "Houston", "Indianapolis", "Irving", "Jacksonville", "Kansas City",
      "Las Vegas", "Lexington", "Lincoln", "Long Beach", "Los Angeles", "Louisville", "Madison", "Memphis", "Mesa", "Miami",
      "Milwaukee", "Minneapolis", "Nashville", "New Orleans", "New York City", "Norfolk", "Oakland", "Oklahoma City", "Omaha", "Orlando",
      "Philadelphia", "Phoenix", "Pittsburgh", "Plano", "Portland", "Raleigh", "Reno", "Richmond", "Riverside", "Rochester",
      "Sacramento", "St. Louis", "St. Paul", "Salt Lake City", "San Antonio", "San Diego", "San Francisco", "San Jose", "Santa Ana",
      "Scottsdale", "Seattle", "Spokane", "Stockton", "Tampa", "Toledo", "Tucson", "Tulsa", "Virginia Beach", "Washington, D.C.",
      "Wichita", "Winston-Salem", "Yonkers"
    ]
]

var countryCurrencySymbols = [
    "Argentina": "$",
    "Australia": "$",
    "Brazil": "R$",
    "Canada": "$",
    "China": "¥",
    "France": "€",
    "Germany": "€",
    "India": "₹",
    "Italy": "€",
    "Japan": "¥",
    "Mexico": "$",
    "Netherlands": "€",
    "New Zealand": "$",
    "Norway": "kr",
    "Portugal": "€",
    "Russia": "₽",
    "Singapore": "S$",
    "South Africa": "R",
    "South Korea": "₩",
    "Spain": "€",
    "Sweden": "kr",
    "Switzerland": "CHF",
    "Turkey": "₺",
    "United Kingdom": "£",
    "United States": "$"
]
