//
//  LocationDataManager.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/6/1402 AP.
//

import Foundation


class LocationDataManager : DataManager {
    private var locations : [String] = []
    
    func loadData() -> [[String:AnyObject]] {
        loadPlist(file: "Locations")
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
