//
//  ViewController.swift
//  MusicByLocation
//
//  Created by JJ Andrew on 26/02/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit
import CoreLocation

// outlet, action, requesting location, acting as location manager delegate, making geocoder lookups, tweaking response to get artist names., updating display

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let iTunesAdaptor = ITunesAdaptor()
    
    var streetName: String? = nil
    var county: String? = ""
    var country: String? = nil
    var postCode: String? = nil
    var houseName: String? = nil
    
    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.requestLocation()
    }

    @IBAction func findArtists(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.iTunesAdaptor.getArtists(search: firstPlacemark.locality) { (artists) in
                            let names = artists?.map { return $0.artistName }
                            self.musicRecommendations.text = names?.joined(separator: ", " )
                            
                        }
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
                        self.musicRecommendations.text = """
                        \(self.houseName!)
                        \(self.streetName!)
                        \(self.county!)
                        \(self.country!)
                        \(self.postCode!)
                        """
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    
    }
    
}
