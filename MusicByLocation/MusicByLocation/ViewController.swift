//
//  ViewController.swift
//  MusicByLocation
//
//  Created by JJ Andrew on 26/02/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit
import CoreLocation

// outlet, action, tweaking response to get artist names., updating display

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let iTunesAdaptor = ITunesAdaptor()
    let locationManagerDelegate = LocationManagerDelegate()
    
    var streetName: String? = nil
    var county: String? = ""
    var country: String? = nil
    var postCode: String? = nil
    var houseName: String? = nil
    
    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = locationManagerDelegate
        locationManagerDelegate.vc = self
    }

    @IBAction func findArtists(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func updateDisplay(text: String?) {
        musicRecommendations.text = text
    }
    
    func updateArtistsByLocation(text: String?) {
        iTunesAdaptor.getArtists(search: text) { (artists) in
            DispatchQueue.main.async {
                let names = artists?.map { return $0.artistName }
                self.musicRecommendations.text = names?.joined(separator: ", " )
            }
        }
    }
    
}
