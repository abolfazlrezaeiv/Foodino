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
        mapView.delegate = self
        manager.fetch(completion:{(anotations) in
            setupMap(anotations)
        })
    }
    
    func setupMap(_ anotations: [RestaurantItem])  {
        mapView.setRegion(manager.initialRegion(latDelta: 0.5, longDelta: 0.5), animated: true)
        mapView.addAnnotations(manager.anotations)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        self.performSegue(withIdentifier: Segue.showDetail.rawValue, sender: self)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation:
    MKAnnotation) -> MKAnnotationView? {
       let identifier = "custompin"
       guard !annotation.isKind(of: MKUserLocation.self)
       else {
          return nil
       }
       let annotationView: MKAnnotationView
       if let customAnnotationView =
       mapView.dequeueReusableAnnotationView(
       withIdentifier: identifier) {
          annotationView = customAnnotationView
          annotationView.annotation = annotation
       } else {
          let av = MKAnnotationView(annotation:
          annotation, reuseIdentifier: identifier)
          av.rightCalloutAccessoryView =
          UIButton(type: .detailDisclosure)
          annotationView = av
       }
       annotationView.canShowCallout = true
       if let image = UIImage(named:
            "custom-annotation") {
                annotationView.image = image
                annotationView.centerOffset = CGPoint(
                x: -image.size.width / 2,
                y: -image.size.height / 2)
       }
       return annotationView
    }
}
