//
//  ItemHelper.swift
//  MigrateMate
//
//  Created by johnny basgallop on 14/12/2023.
//

import Foundation
import SwiftUI

func runItemCheck(apicontroller : ApiController, item: [String: Any] ){
    
    if(item["item_name"] as! String == "Price per square meter to Buy Apartment Outside of City Center"){
        apicontroller.ppsmOCC = item["avg"] as! Double
    }
    
    if(item["item_name"] as! String == "Price per square meter to Buy Apartment in City Center"){
        apicontroller.ppsmCC = item["avg"] as! Double
    }
    
    if(item["item_name"] as! String == "One bedroom apartment in city centre"){
        apicontroller.rcc = item["avg"] as! Double
    }
    
    if(item["item_name"] as! String == "One bedroom apartment outside of city centre"){
        apicontroller.rocc = item["avg"] as! Double
    }
    
    if(item["item_name"] as! String == "Three bedroom apartment in city centre"){
        apicontroller.threeBrcc = item["avg"] as! Double
    }
    
    if(item["item_name"] as! String == "Three bedroom apartment outside of city centre"){
        apicontroller.threeBrocc = item["avg"] as! Double
    }
    
    if(item["item_name"] as! String == "Basic utilities for 85 square meter Apartment including Electricity, Heating or Cooling, Water and Garbage"){
        apicontroller.basicUtilities = item["avg"] as! Double
    }
    
    if(item["item_name"] as! String == "Internet, 60 Mbps or More, Unlimited Data, Cable/ADSL"){
        apicontroller.wifi = item["avg"] as! Double
    } 
    
    if(item["item_name"] as! String == "Gasoline, 1 liter"){
        apicontroller.petrol = item["avg"] as! Double
    }  
    
    if(item["item_name"] as! String == "One-way Ticket, Local Transport"){
        apicontroller.singleTrainTicket = item["avg"] as! Double
    } 
    
    if(item["item_name"] as! String == "Taxi, price for 1 km, Normal Tariff"){
        apicontroller.taxiPerKm = item["avg"] as! Double
    }
    
    if(item["item_name"] as! String == "Taxi Start, Normal Tariff"){
        apicontroller.taxiTarrif = item["avg"] as! Double
    }
    
    if(item["item_name"] as! String == "Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)"){
        apicontroller.newGolf = item["avg"] as! Double
    }
    
    
}
