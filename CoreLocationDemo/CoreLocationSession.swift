//
//  CoreLocationSession.swift
//  CoreLocationDemo
//
//  Created by Laxmikanth Reddy on 24/11/22.
//

import Foundation
import CoreLocation


class CoreLocationSession: NSObject {
    
    public var locationManager: CLLocationManager!
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        
        // request the user's location
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        // the following keys needs to be added to the info.plist file
        /*
         NSLocationAlwaysAndWhenInUseUsageDescription
         NSLocationWhenInUseUsageDescription
        */
        
        // get updates for user location
        locationManager.startUpdatingLocation()
    }
    
}

extension CoreLocationSession: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations: \(locations)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        case .authorized:
            print("authorized")
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("didEnterRegion")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("didExitRegion")
    }
    
}
