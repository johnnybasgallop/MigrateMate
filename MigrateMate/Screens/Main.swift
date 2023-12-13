//
//  Main.swift
//  MigrateMate
//
//  Created by johnny basgallop on 13/12/2023.
//

import SwiftUI

struct Main: View {
    @Binding var ActiveSearch : Bool
    @StateObject var apiController = ApiController()
    
    
    var body: some View {
        
        VStack{
            if !ActiveSearch{
                topBar()
                SearchScreen(apiController: apiController)
            }
        }
        
    }
}

struct topBar : View {
    var body: some View {
        
        HStack{
            LogoutButton()
            Spacer()
            
            TitleLogo()
            
            Spacer()
            
            
        }.padding()
        Spacer()
        
    }
}

struct LogoutButton : View {
    @State var logoutAlertShowing: Bool = false
    @AppStorage ("log_state") var log_state = false
    var body: some View {
        Button(
            action: {
                logoutAlertShowing = true
            }, label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.system(size: 25))
                    .foregroundColor(Color("PrimaryCol"))
            })
        
        .alert(isPresented: $logoutAlertShowing) {
            Alert(
                title: Text("Logout of account"),
                message: Text("By confirming you will logout of your MigrateMate account"),
                primaryButton: .default(Text("Logout")) {
                    
                    log_state = false
                    
                    logoutAlertShowing = false
                },
                secondaryButton: .cancel(Text("Cancel")) {
                    logoutAlertShowing = false
                }
            )
        }
    }
}


struct SearchScreen : View {
    @ObservedObject var apiController: ApiController
   
    let countries = [
        "United States",
        "China",
        "India",
        "Brazil",
        "Russia",
        "Japan",
        "Germany",
        "United Kingdom",
        "France",
        "Italy",
        "Australia", "South Korea", "Mexico", "South Africa", "Turkey",
        "Argentina", "Netherlands", "Sweden", "Switzerland", "Singapore"
    ]
    
    let citiesByCountry: [String: [String]] = [
        "United States": ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"],
        "China": ["Shanghai", "Beijing", "Guangzhou", "Shenzhen", "Chongqing"],
        "India": ["Mumbai", "Delhi", "Bangalore", "Chennai", "Kolkata"],
        "Brazil": ["Sao Paulo", "Rio de Janeiro", "Brasilia", "Salvador", "Fortaleza"],
        "Russia": ["Moscow", "Saint Petersburg", "Novosibirsk", "Yekaterinburg", "Nizhny Novgorod"],
        "Japan": ["Tokyo", "Yokohama", "Osaka", "Nagoya", "Sapporo"],
        "Germany": ["Berlin", "Hamburg", "Munich", "Cologne", "Frankfurt"],
        "United Kingdom": ["London", "Birmingham", "Manchester", "Glasgow", "Liverpool"],
        "France": ["Paris", "Marseille", "Lyon", "Toulouse", "Nice"],
        "Italy": ["Rome", "Milan", "Naples", "Turin", "Palermo"],
        "Australia": ["Sydney", "Melbourne", "Brisbane", "Perth", "Adelaide"],
        "South Korea": ["Seoul", "Busan", "Incheon", "Daegu", "Daejeon"],
        "Mexico": ["Mexico City", "Guadalajara", "Monterrey", "Puebla", "Tijuana"],
        "South Africa": ["Johannesburg", "Cape Town", "Durban", "Pretoria", "Port Elizabeth"],
        "Turkey": ["Istanbul", "Ankara", "Izmir", "Bursa", "Adana"],
        "Argentina": ["Buenos Aires", "Cordoba", "Rosario", "Mendoza", "San Miguel de Tucuman"],
        "Netherlands": ["Amsterdam", "Rotterdam", "The Hague", "Utrecht", "Eindhoven"],
        "Sweden": ["Stockholm", "Gothenburg", "Malmö", "Uppsala", "Linköping"],
        "Switzerland": ["Zurich", "Geneva", "Basel", "Bern", "Lausanne"],
        "Singapore": ["Singapore City", "Jurong", "Tampines", "Woodlands", "Changi"]
    ]
    
    @State private var selectedCountry = 0
    @State private var selectedCity = 0
    
    var body: some View {
        
        VStack {
            
            Image("SearchIllustration").resizable()
                .frame(width: screenWidth * 0.6, height: screenWidth * 0.6)
                .offset(y: -screenHeight * 0.12)
       
            
            VStack{
                
                Text("\(apiController.ppsmCC)")
                
                Picker("Select Country", selection: $selectedCountry) {
                    ForEach(0..<countries.count) {
                        Text(self.countries[$0])
                    }
                }
                .accentColor(Color("PrimaryCol"))
                .pickerStyle(.menu)
                
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                    .frame(width: screenWidth * 0.7)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                )
                .foregroundColor(.blue) // Set the text color here
                .padding()
                
                
                
                Picker("Select City", selection: $selectedCity) {
                    if let cities = citiesByCountry[countries[selectedCountry]] {
                        ForEach(0..<cities.count) {
                            Text(cities[$0]).fontWeight(.bold)
                        }
                    }
                }
                
//                Add extra picker if its USA to select the State then the city
                
                .accentColor(Color("PrimaryCol"))
                .pickerStyle(DefaultPickerStyle()) // Use DefaultPickerStyle to have the native look and feel
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                    .frame(width: screenWidth * 0.7)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                )
                .foregroundColor(.blue) // Set the text color here
                .padding()
                
            }.offset(y: -screenHeight * 0.06)
            
            SearchButton(apiController: apiController,selectedCountry: $selectedCountry, selectedCity: $selectedCity, countries: countries, cities: citiesByCountry)
        }
        .navigationTitle("Country and City Picker")
    }
}

struct SearchButton : View {
    @ObservedObject var apiController: ApiController
    @Binding var selectedCountry: Int
    @Binding var selectedCity: Int
    var countries : [String]
    var cities: [String: [String]]
    
    var body: some View {
        Button(action: {
            print("GO")
            
            var country : String = countries[selectedCountry]
            var city : [String] = cities[country]!
            var cityValue : String = city[selectedCity]
            
            print(cityValue)
            
            apiController.fetchCostOfLivingData(Country: countries[selectedCountry], City: cityValue)
        }, label: {
            Text("Search").multilineTextAlignment(.center).foregroundColor(.white).fontWeight(.bold)
        }).frame(width: screenWidth * 0.75 ,height: screenHeight * 0.06)
            .background(Color("PrimaryCol"))
            .cornerRadius(20)
    }
}

#Preview {
    Main(ActiveSearch: .constant(false))
}
