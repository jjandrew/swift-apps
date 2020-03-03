//
//  ViewController.swift
//  MusicByLocation
//
//  Created by JJ Andrew on 26/02/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
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
        getArtists()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
                } else {
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
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user's location. Error: \(error.localizedDescription)"
    }
    
    func getArtists() -> String {
        guard let url = URL(string:
            "https://itunes.apple.com/search?term=\(self.county!)&entity=musicArtist")
            else {
                print("Invalid URL")
                return "Invalid URL. Wasn't able to search ITunes"
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data,response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.artistName
                    }
                    
                    DispatchQueue.main.async {
                        self.musicRecommendations.text = names.joined(separator: ", ")
                    }
                }
            }
        }.resume()
        
        return ""
        
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
          return artistResponse
        } else {
            print("Failed to decode to Artist Response")
            return nil
        }
        
    }
}


//1. What is a thread.
//2. I am a bit confused with when self needs to be used.
//3. How does swift decode from a java response.
