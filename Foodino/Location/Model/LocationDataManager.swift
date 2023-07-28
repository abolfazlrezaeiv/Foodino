//
//  LocationDataManager.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/6/1402 AP.
//

import Foundation


class LocationDataManager {
    private var locations : [String] = []
    
    func loadData() -> [[String:String]] {
        // This is used to decode plist file's data
   
        guard let path = Bundle.main.path(forResource: "Locations", ofType: ".plist"),
  
        let locationData = FileManager.default.contents(atPath: path),
        
        let locations = try? PropertyListDecoder().decode([[String:String]].self, from: locationData) else {
            return []
        }
        return locations
    }
    
    func fetchData()  {
        for location in loadData() {
            if let city = location["city"], let state = location["state"]{
                locations.append("\(city) \(state)")
            }
        }
    }
    
    func numberOfLocationItems() -> Int {
        locations.count
    }
    
    func locationItem(at index: Int) -> String {
        locations[index]
    }
}
