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
       if !items.isEmpty {
          items.removeAll()
       }
       for data in loadPlist(file: "MapLocations") {
          items.append(RestaurantItem(dict: data))
       }
       completion(items)
    }
    
    func initialRegion(latDelta: CLLocationDegrees, longDelta: CLLocationDegrees) -> MKCoordinateRegion {
           guard let item = items.first else {
              return MKCoordinateRegion()
           }
           let span = MKCoordinateSpan(latitudeDelta:latDelta, longitudeDelta: longDelta)
           return MKCoordinateRegion(center: item.coordinate,span: span)
    }
}
