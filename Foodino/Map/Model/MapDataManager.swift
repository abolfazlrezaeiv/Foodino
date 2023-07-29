//
//  MapDataManager.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/7/1402 AP.
//

import Foundation


class MapDataManager {
    private var items : [RestaurantItem] = []
    var ansotations: [RestaurantItem] {
        items
    }
    
    func loadData() -> [[String:AnyObject]] {
       guard let path = Bundle.main.path(forResource: "MapLocations", ofType: "plist"),
             let itemsData = FileManager.default.contents(atPath: path),
             let items = try! PropertyListSerialization
        .propertyList(from: itemsData, format: nil) as? [[String : AnyObject]] else {
           return []
       }
        return items
    }
    
    func fetch(completion: (_ annotations:[RestaurantItem]) -> ()) {
       if !items.isEmpty {
          items.removeAll()
       }
       for data in loadData() {
          items.append(RestaurantItem(dict: data))
       }
       completion(items)
    }
}
