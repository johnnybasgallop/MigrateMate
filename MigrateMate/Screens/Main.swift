//
//  Main.swift
//  MigrateMate
//
//  Created by johnny basgallop on 13/12/2023.
//

import SwiftUI

struct Main: View {
    
    @StateObject var apiController = ApiController()
    @State var isLoading : Bool = false
    @State private var selectedCountry = 23
    @State private var selectedCity = 0
    
    var body: some View {
        
        VStack{
            
            
            
            if isLoading{
                topBar()
                ProgressView().frame(width: screenWidth,height: screenHeight * 0.8).offset(y: -screenHeight * 0.05)
            }
            
            if apiController.activeSearch && !isLoading{
                var country = countries[selectedCountry]
                var city : [String] = citiesByCountry[country]!
                var cityValue : String = city[selectedCity]
                
                MainScreen(apiController: apiController, selectedCountry: country, selectedCity: cityValue)
            }
            
            else if !apiController.activeSearch && !isLoading{
                topBar()
                SearchScreen(apiController: apiController, isLoading: $isLoading,selectedCountry: $selectedCountry, selectedCity: $selectedCity)
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
    @Binding var isLoading : Bool
    @Binding var selectedCountry : Int
    @Binding var selectedCity : Int
    
    var body: some View {
    
        
        VStack {
            
            Image("SearchIllustration").resizable()
                .frame(width: screenWidth * 0.6, height: screenWidth * 0.6)
                .offset(y: -screenHeight * 0.12)
       
            
            VStack{
                
            
                
                Picker("Select Country", selection: $selectedCountry) {
                    ForEach(0..<countries.count) {
                        Text(countries[$0])
                    }
                }                .accentColor(Color("PrimaryCol"))
                    .pickerStyle(.automatic)
                
                
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
            
            SearchButton(apiController: apiController,selectedCountry: $selectedCountry, isLoading: $isLoading, selectedCity: $selectedCity, countries: countries, cities: citiesByCountry)
        }
        .navigationTitle("Country and City Picker")
    }
}




struct SearchButton : View {
    @ObservedObject var apiController: ApiController
    @Binding var selectedCountry: Int
    @Binding var isLoading : Bool
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
            
            isLoading = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2){
                isLoading = false
            }
            
            
            apiController.fetchCostOfLivingData(Country: countries[selectedCountry], City: cityValue)
        }, label: {
            Text("Search").multilineTextAlignment(.center).foregroundColor(.white).fontWeight(.bold)
                .frame(width: screenWidth * 0.75 ,height: screenHeight * 0.06)
        }).frame(width: screenWidth * 0.75 ,height: screenHeight * 0.06)
            .background(Color("PrimaryCol"))
            .cornerRadius(20)
    }
}

#Preview {
    Main()
}
