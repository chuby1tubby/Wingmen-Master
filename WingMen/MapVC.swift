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

        mapView.addAnnotation(azusaPacific)

        
        
    }
    
    let regionRadius: CLLocationDistance = 10000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
