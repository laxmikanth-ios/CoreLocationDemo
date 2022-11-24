//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by Laxmikanth Reddy on 24/11/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    private let locationSession = CoreLocationSession()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        convertCoordinateToPlacemark()
        convertPlacenameToCoordinate()
        
        // configure map view
        // attempt to show the user's current location
        mapView.showsUserLocation = true
    }


    private func convertCoordinateToPlacemark() {
        if let location = Location.getLocations().first {
            locationSession.convertCoordinateToPlacemark(coordinate: location.coordinate)
        }
    }
    
    private func convertPlacenameToCoordinate() {
        locationSession.convertPlacemarkToCoordinate(addressString: "Hyderabad")
    }
}

