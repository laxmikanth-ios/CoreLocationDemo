//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by Laxmikanth Reddy on 24/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let locationSession = CoreLocationSession()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        convertCoordinateToPlacemark()
        convertPlacenameToCoordinate()
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

