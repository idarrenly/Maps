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
        let latitude: CLLocationDegrees = 37.37
        let longitude: CLLocationDegrees = -121.91

        //Zoom level
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        //Span-Coordinate-Region
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
        
        //Set Map
        mapView.setRegion(region, animated: true)
        
        //Annotation using default location above
        let annotation = MKPointAnnotation()
        annotation.title = "Coding Dojo Silicon Valley"
        annotation.subtitle = "Nice place to learn"
        annotation.coordinate = coordinates
        mapView.addAnnotation(annotation)
        
        //Annotation by long press an area on map
        let theLongPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:)))
        theLongPress.minimumPressDuration = 2
        mapView.addGestureRecognizer(theLongPress)
    }
    
    //Function
    @objc func longPress(gestureRecognizer: UIGestureRecognizer) {
        //Determine where the touch point is and convert that point to coordinate on the map
        let touchPoint = gestureRecognizer.location(in: self.mapView)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        
        //Set Annotation with touch point coordinate
        let annotation = MKPointAnnotation()
        annotation.title = "New Place Title"
        annotation.subtitle = "New Place Subtitle"
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

