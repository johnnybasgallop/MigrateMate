//
//  ApiController.swift
//  MigrateMate
//
//  Created by johnny basgallop on 13/12/2023.
//

import Foundation
import Alamofire

class ApiController: ObservableObject {
    
    @Published var activeSearch : Bool = false
    
    @Published var ppsmCC: Double = 0.0
    @Published var ppsmOCC: Double = 0.0
    @Published var rcc: Double = 0.0
    @Published var rocc: Double = 0.0
    @Published var threeBrcc: Double = 0.0
    @Published var threeBrocc: Double = 0.0
    
    @Published var basicUtilities : Double = 0.0
    @Published var wifi : Double = 0.0
    
    
    @Published var petrol : Double = 0.0
    @Published var singleTrainTicket : Double = 0.0
    @Published var taxiTarrif : Double = 0.0
    @Published var taxiPerKm : Double = 0.0
    @Published var newGolf : Double = 0.0

    
    
    let headers : HTTPHeaders = [
        "X-RapidAPI-Key": "3ca296bda3msh869858e0f53d7a6p1c0a7bjsn048eee98983c",
        "X-RapidAPI-Host": "cost-of-living-and-prices.p.rapidapi.com"
    ]
    
    func fetchCostOfLivingData(Country: String, City: String) {
        let url = "https://cost-of-living-and-prices.p.rapidapi.com/prices"
        
        print("called")
        
        let Params: [String: String] = [
            "city_name": "\(City)",
            "country_name": "\(Country)",
        ]
        
        
        AF.request(url, method: .get, parameters: Params, headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any],
                       let results = json["prices"] as? [[String: Any]] {
                        
                   
                        self.activeSearch = true
                        
//                        Highly innefficient method of assigning the variables, but the API response is so overly populated with data, this is the quickest system
                        
                        for item in results {
                            
                            runItemCheck(apicontroller: self, item: item)
                            
                            
                            
                            
                        }
                   
                        
                    }
                    
                case .failure(let error):
                    // Handle the error here
                    print(error)
                    print("no no")
                }
            }
        
    }
    
    
}



