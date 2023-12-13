//
//  ApiController.swift
//  MigrateMate
//
//  Created by johnny basgallop on 13/12/2023.
//

import Foundation
import Alamofire

class ApiController: ObservableObject {
    
    
    @Published var ppsmCC: Double = 0.0
    @Published var ppsmOCC: Double = 0.0
    @Published var rcc: Double = 0.0
    @Published var rocc: Double = 0.0
    
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
                        
                   
                        
                        
                        for item in results {
                            
                            if(item["item_name"] as! String == "Price per square meter to Buy Apartment Outside of City Center"){
                                self.ppsmOCC = item["avg"] as! Double
                            }
                            
                            if(item["item_name"] as! String == "Price per square meter to Buy Apartment in City Center"){
                                self.ppsmCC = item["avg"] as! Double
                            }
                            
                            if(item["item_name"] as! String == "One bedroom apartment in city centre"){
                                self.rcc = item["avg"] as! Double
                            }
                            
                            if(item["item_name"] as! String == "Three bedroom apartment outside of city centre"){
                                self.rocc = item["avg"] as! Double
                            }
                            
                            
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



