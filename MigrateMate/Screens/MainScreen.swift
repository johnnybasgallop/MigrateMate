//
//  MainScreen.swift
//  MigrateMate
//
//  Created by johnny basgallop on 14/12/2023.
//

import Foundation
import SwiftUI

func round(_ num: Double, to places: Int) -> String{
    let p = log10(abs(num))
    let f = pow(10, p.rounded() - Double(places) + 1)
    let rnum = (num / f).rounded() * f
    
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumFractionDigits = 0
    numberFormatter.maximumFractionDigits = 0
    numberFormatter.numberStyle = .decimal
    
    let roundedValue = rnum.rounded()
    
    // Convert to a string to remove trailing zeros
    let formattedString = numberFormatter.string(from: NSNumber(value: roundedValue))!
    
    
    return formattedString
    
}


struct MainScreen : View {
    @ObservedObject var apiController : ApiController
    var selectedCountry : String
    var selectedCity : String
    var body: some View {
        
        VStack{
            HStack{
                Button(action: {
                    withAnimation{
                        apiController.activeSearch = false
                    }
                    
                }, label: {
                    HStack{
                        Image(systemName: "arrow.backward").font(.system(size: 26)).foregroundColor(Color("PrimaryCol")).offset(x: screenWidth * 0.08)
                        Spacer()
                        Text("\(selectedCity.capitalized), \(selectedCountry.capitalized)").font(.system(size: 21)).fontWeight(.bold).foregroundColor(Color("PrimaryCol"))
                        Spacer()
                    }
                })
                
            }.frame(height: screenHeight * 0.05)
            
       
            ScrollView{
               
                SalaryBox(text: "Average Salary after tax", ImageName: "dollarsign.square.fill", data: apiController.SalaryPerMonth, country: selectedCountry)
                HousingColumn(Country: selectedCountry, apiController: apiController)
                BasicUtilities(apiController: apiController, country: selectedCountry)
                Travel(apiController: apiController, country: selectedCountry)
                FoodAndDrink(apiController: apiController, country: selectedCountry).padding(.bottom,screenHeight * 0.15)
               
                
            }.frame(width: screenWidth, height: screenHeight * 0.95)
            
            Spacer()
        }
        .padding(.top, screenHeight * 0.185)
        .frame(width: screenWidth,height: screenHeight)
    }
    
}

struct HousingColumn: View {
    var Country : String
    @ObservedObject var apiController : ApiController
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: screenWidth * 0.93, height: screenHeight * 0.41)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
            
            VStack(alignment: .leading) {
                Text("Accomodation")
                    .font(.system(size: 22,weight: .bold))
                    .foregroundColor(Color("PrimaryCol"))
                
                HousingItem(text: "$/㎡ in city centre", ImageName: "house.fill", data: apiController.ppsmCC, country: Country).foregroundColor(Color("PrimaryCol"))
                
                HousingItem(text: "$/㎡ out of centre", ImageName: "house", data: apiController.ppsmOCC, country: Country).foregroundColor(Color("PrimaryCol"))
                
                HousingItem(text: "1Bed rent city centre", ImageName: "building.fill", data: apiController.rcc, country: Country).foregroundColor(Color("PrimaryCol"))
                
                HousingItem(text: "1Bed rent out of centre", ImageName: "building", data: apiController.rcc, country: Country).foregroundColor(Color("PrimaryCol"))
                
                HousingItem(text: "3Bed rent city centre", ImageName: "building.2", data: apiController.threeBrcc, country: Country).foregroundColor(Color("PrimaryCol"))
                
                HousingItem(text: "3Bed rent out of centre", ImageName: "building.2.fill", data: apiController.threeBrocc, country: Country).foregroundColor(Color("PrimaryCol"))
                
            }
            .padding(20)
        }
        .padding()
    }
}


struct SalaryBox : View {
    var text: String
    var ImageName: String
    var data: Double
    var country : String

    var body: some View {
        
        
        var newData = round(data, to: 3)
        
        if let currencySymbol = countryCurrencySymbols[country] {
            
            
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: screenWidth * 0.93, height: screenHeight * 0.18)
                    .foregroundColor(Color("PrimaryCol"))
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                
                VStack(alignment: .leading) {
                    Text("Salary")
                        .font(.system(size: 25,weight: .bold))
                        .foregroundColor(.white)
                        
            
                    Text(text).font(.system(size: 19,weight: .semibold)).foregroundColor(.white)
            HStack{
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: screenWidth * 0.09, height: screenWidth * 0.1)
                    .foregroundColor(.white)
                    .overlay(
                        Text("\(currencySymbol)").font(.system(size: 25)).fontWeight(.bold).foregroundColor(Color("PrimaryCol"))
                        
                    ).padding(.trailing,5)
                
                Text("\(newData)/Month").font(.system(size: 37,weight: .semibold)).foregroundColor(.white)
                

                
            }.padding(.vertical,6)
                .padding(.horizontal,3)
        }.padding()
            }
            .padding(20)
        }
        
        
    }
}



struct HousingItem : View {
    var text: String
    var ImageName: String
    var data: Double
    var country : String

    var body: some View {
        
        
        var newData = round(data, to: 3)
        
        if let currencySymbol = countryCurrencySymbols[country] {
            
            HStack{
                Image(systemName: ImageName).frame(width: 25)
                Text(text).font(.system(size: 15,weight: .semibold))
                Spacer()
                
                
                
                VStack {
                    Text("\(currencySymbol)\(newData)").fontWeight(.bold).foregroundColor(Color("PrimaryCol")).padding(.horizontal , 15).padding(.vertical,2)
                }.overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("PrimaryCol"), lineWidth: 1)
                )
                
                
            }.padding(.vertical,6)
                .padding(.horizontal,3)
        }
    }
}


struct TransportItem : View {
    var text: String
    var ImageName: String
    var data: Double
    var country : String

    var body: some View {
        
        
        var newData = String(format: "%.2f", data)
        
        if let currencySymbol = countryCurrencySymbols[country] {
            
            HStack{
                Image(systemName: ImageName).frame(width: 25)
                Text(text).font(.system(size: 15,weight: .semibold))
                Spacer()
                
                
                
                VStack {
                    Text("\(currencySymbol)\(newData)").fontWeight(.bold).foregroundColor(Color("PrimaryCol")).padding(.horizontal , 15).padding(.vertical,2)
                }.overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("PrimaryCol"), lineWidth: 1)
                )
                
                
            }.padding(.vertical,6)
                .padding(.horizontal,3)
        }
    }
}


struct BasicUtilities : View {
    @ObservedObject var apiController : ApiController
    var country: String
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: screenWidth * 0.93, height: screenHeight * 0.21)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
            
            VStack(alignment: .leading) {
                HStack{
                    Text("Bills & Utilities")
                        .font(.system(size: 22,weight: .bold))
                        .foregroundColor(Color("PrimaryCol"))
                    
                }
                
                HousingItem(text: "Gas/Water/Electric", ImageName: "bolt.fill", data: apiController.basicUtilities, country: country).foregroundColor(Color("PrimaryCol"))
                
                HousingItem(text: "60Mbps or more internet", ImageName: "wifi", data: apiController.wifi, country: country).foregroundColor(Color("PrimaryCol"))
              
              
            }
            .padding(20)
        }
        .padding()
    }
}




struct Travel : View {
    @ObservedObject var apiController : ApiController
    var country: String
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: screenWidth * 0.93, height: screenHeight * 0.35)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                
            
            VStack(alignment: .leading) {
                
                    Text("Transportation")
                        .font(.system(size: 22,weight: .bold))
                        .foregroundColor(Color("PrimaryCol"))
               
                    
                
                
                TransportItem(text: "Petrol per litre", ImageName: "bolt.car", data: apiController.petrol, country: country).foregroundColor(Color("PrimaryCol"))
                
                TransportItem(text: "One way train ticket", ImageName: "ticket.fill", data: apiController.singleTrainTicket, country: country).foregroundColor(Color("PrimaryCol"))
                
                TransportItem(text: "Taxi Starting tariff", ImageName: "car.front.waves.up", data: apiController.taxiTarrif, country: country).foregroundColor(Color("PrimaryCol"))
                
                
                TransportItem(text: "Taxi cost per km", ImageName: "road.lanes", data: apiController.taxiPerKm, country: country).foregroundColor(Color("PrimaryCol"))
                
                HousingItem(text: "Brand new VW Golf", ImageName: "car.fill", data: apiController.newGolf, country: country).foregroundColor(Color("PrimaryCol"))
                
                
                
              
              
            }
            .padding(20)
            
        }
        .padding()
    }
}

struct FoodAndDrink : View {
    @ObservedObject var apiController : ApiController
    var country: String
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: screenWidth * 0.93, height: screenHeight * 0.35)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
            
            VStack(alignment: .leading) {
                
                    Text("Food & Drink")
                        .font(.system(size: 22,weight: .bold))
                        .foregroundColor(Color("PrimaryCol"))
               
                    
                
                
                TransportItem(text: "Cappuccino", ImageName: "cup.and.saucer.fill", data: apiController.cappuccino, country: country).foregroundColor(Color("PrimaryCol"))
                
                TransportItem(text: "0.5L Domestic Beer", ImageName: "mug.fill", data: apiController.beer, country: country).foregroundColor(Color("PrimaryCol"))
                
                TransportItem(text: "1.5L water bottle", ImageName: "drop.fill", data: apiController.water, country: country).foregroundColor(Color("PrimaryCol"))
                
                
                TransportItem(text: "McDonalds Meal", ImageName: "takeoutbag.and.cup.and.straw.fill", data: apiController.maccies, country: country).foregroundColor(Color("PrimaryCol"))
                
                TransportItem(text: "Restaurant Meal for 2", ImageName: "fork.knife", data: apiController.restaurantMeal, country: country).foregroundColor(Color("PrimaryCol"))
                
         
             
                
                
                
              
              
            }
            .padding(20)
        }
        .padding()
    }
}




#Preview {
    MainScreen(apiController: ApiController(), selectedCountry: "Australia",selectedCity: "Sydney")
}
