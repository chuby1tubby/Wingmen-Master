//
//  UserProfileVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/10/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 34.1300755, longitude: -117.88835929999999)
        centerMapOnLocation(location: initialLocation)
        
        let azusaPacific = Pin(title: "Azusa Pacific University", coordinate: CLLocationCoordinate2D(latitude: 34.1300755, longitude: -117.88835929999999), info: "God First Since 1899")
        
        let pin1 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.131, longitude: -117.884), info: "")
        let pin2 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.133, longitude: -117.884), info: "")
        let pin3 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.134, longitude: -117.882), info: "")
        let pin4 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.131, longitude: -117.882), info: "")
        let pin5 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.132, longitude: -117.881), info: "")
        let pin6 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.136, longitude: -117.882), info: "")
        let pin7 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.136, longitude: -117.889), info: "")
        let pin8 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.138, longitude: -117.887), info: "")
        let pin9 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.139, longitude: -117.868), info: "")
        let pin10 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.138, longitude: -117.887), info: "")
        let pin11 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.132, longitude: -117.882), info: "")
        let pin12 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.133, longitude: -117.881), info: "")
        let pin13 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.132, longitude: -117.883), info: "")
        let pin14 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.133, longitude: -117.886), info: "")
        let pin15 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.235, longitude: -117.884), info: "")
        let pin16 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.136, longitude: -117.685), info: "")
        let pin17 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.135, longitude: -117.885), info: "")
        let pin18 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.238, longitude: -117.781), info: "")
        let pin19 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.332, longitude: -117.886), info: "")
        let pin20 = Pin(title: "Username", coordinate: CLLocationCoordinate2D(latitude: 34.231, longitude: -117.889), info: "")
        
        let pinArray = [pin1, pin2, pin3, pin4, pin5, pin6, pin7, pin8, pin9, pin10, pin11, pin12, pin13, pin14, pin15, pin16, pin17, pin18, pin19, pin20]
        

        mapView.addAnnotation(azusaPacific)
        for pin in pinArray {
            mapView.addAnnotation(pin)
        }
    }
    
    let regionRadius: CLLocationDistance = 10000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
