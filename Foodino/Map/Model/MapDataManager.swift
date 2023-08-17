//
//  MapDataManager.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/7/1402 AP.
//

import Foundation
import MapKit


class MapDataManager : DataManager {
    private var items : [RestaurantItem] = []
    var anotations: [RestaurantItem] {
        items
    }
    
    
    func fetch(completion: (_ annotations:[RestaurantItem]) -> ()) {
        let manager = RestaurantDataManager()
        manager.fetch(location: "Boston") { restaurantItems in
            self.items = restaurantItems
            completion(items)
        }
    }
    
    func initialRegion(latDelta: CLLocationDegrees, longDelta: CLLocationDegrees) -> MKCoordinateRegion {
           guard let item = items.first else {
              return MKCoordinateRegion()
           }
           let span = MKCoordinateSpan(latitudeDelta:latDelta, longitudeDelta: longDelta)
           return MKCoordinateRegion(center: item.coordinate,span: span)
    }
}
