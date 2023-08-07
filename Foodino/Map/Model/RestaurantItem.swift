//
//  RestaurantItem.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/7/1402 AP.
//

import UIKit
import MapKit

class RestaurantItem: NSObject, MKAnnotation,Decodable {
   
    let name: String?
    let cuisines: [String]
    let lat: Double?
    let long: Double?
    let address: String?
    let postalCode: String?
    let state: String?
    let imageURL: String?
    let restaurantID: Int?
    var coordinate: CLLocationCoordinate2D {
       guard let lat = lat, let long = long else {
          return CLLocationCoordinate2D()
       }
       return CLLocationCoordinate2D(latitude: lat,
       longitude: long)
    }
    var title: String? {
        name
    }
    
    var subtitle: String? {
        if cuisines.isEmpty {
            return ""
        }
        if cuisines.count == 1 {
            return cuisines.first
        }else{
            return cuisines.joined(separator:  ", ")
        }
    }
    
    enum CodingKeys: String , CodingKey {
        case name
        case cuisines
        case lat
        case long
        case address
        case postalCode = "postal_code"
        case state
        case imageURL = "image_url"
        case restaurantID = "id"
    }
}
