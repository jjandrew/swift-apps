//
//  LocationSearchViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 24/11/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class LocationSearchViewController: UIViewController {

    @IBOutlet var locationTextEntry: UITextField!
    @IBOutlet var currentLocationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if profile.userLocation != nil {
            currentLocationLabel.text = profile.userLocation
        } else {
            currentLocationLabel.text = "Unable to access location"
        }
    }
    
    @IBAction func searchByTextEntry(_ sender: Any) {
        let handlingOfSkiddle = HandlingOfSkiddle()
        print(handlingOfSkiddle.createUrlForLocation()!)
    }
    
    @IBAction func searchByCurrentLocation(_ sender: Any) {
    }
}
