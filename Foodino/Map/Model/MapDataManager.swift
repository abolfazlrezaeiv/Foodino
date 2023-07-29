//
//  MapDataManager.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/7/1402 AP.
//

import Foundation


class MapDataManager : DataManager {
    private var items : [RestaurantItem] = []
    var ansotations: [RestaurantItem] {
        items
    }
    
    
    func fetch(completion: (_ annotations:[RestaurantItem]) -> ()) {
       if !items.isEmpty {
          items.removeAll()
       }
       for data in loadPlist(file: "MapLocations") {
          items.append(RestaurantItem(dict: data))
       }
       completion(items)
    }
}
