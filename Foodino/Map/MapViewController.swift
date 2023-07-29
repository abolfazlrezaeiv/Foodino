//
//  MapViewController.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/7/1402 AP.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {
    private let manager = MapDataManager()

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
      

    }
    
    func initialize() {
        manager.fetch(completion:{(anotations) in
            setupMap(anotations)
        })
    }
    
    func setupMap(_ anotations: [RestaurantItem])  {
        mapView.setRegion(manager.initialRegion(latDelta: 0.5, longDelta: 0.5), animated: true)
        mapView.addAnnotations(manager.anotations)
    }
}
