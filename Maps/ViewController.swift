//
//  ViewController.swift
//  Maps
//
//  Created by dly on 10/14/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Default location
        let latitude: CLLocationDegrees = 37.35
        let longitude: CLLocationDegrees = -121.95

        //Zoom level
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        //Span-Coordinate-Region
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        
        //Set Map
        mapView.setRegion(region, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

