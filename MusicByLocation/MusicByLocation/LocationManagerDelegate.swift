//
//  LocationManagerDelegate.swift
//  MusicByLocation
//
//  Created by JJ Andrew on 05/03/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {
    let geocoder = CLGeocoder()
    weak var vc: ViewController?
    //when to use weak reference
    //whats a strong reference cycle and how is it not being cleared up from memory an issue
    
    var streetName: String? = nil
    var county: String? = ""
    var country: String? = nil
    var postCode: String? = nil
    var houseName: String? = nil
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        vc?.updateDisplay(text: "Could not access user's location. Error: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.vc?.updateDisplay (text: "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)")
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.vc?.updateArtistsByLocation(text: firstPlacemark.locality)
                        self.houseName = placemarks?[0].name
                        if self.houseName == nil {
                            self.houseName = "No house name available"
                        } else {
                            self.houseName = self.houseName!
                        }
                        self.streetName = placemarks?[0].thoroughfare
                        if self.streetName == nil {
                            self.streetName = "No street name available"
                        } else {
                            self.streetName = self.streetName!
                        }
                        self.county = placemarks?[0].locality
                        if self.county == nil {
                            self.county = "No county available"
                        } else {
                            self.county = self.county!
                        }
                        self.country = placemarks?[0].country
                        if self.country == nil {
                            self.country = "No country available"
                        } else {
                            self.country = self.country!
                        }
                        self.postCode = placemarks?[0].postalCode
                        if self.postCode == nil {
                            self.postCode = "No postal code available"
                        } else {
                            self.postCode = self.postCode!
                        }
                        self.vc?.updateDisplay(text: """
                        \(self.houseName!)
                        \(self.streetName!)
                        \(self.county!)
                        \(self.country!)
                        \(self.postCode!)
                        """)
                    }
                }
            })
        }
    }
    
}
