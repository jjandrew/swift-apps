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
    
    var searchEntry = ""
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if profile.userLocation != nil {
            currentLocationLabel.text = profile.userLocation
        } else {
            currentLocationLabel.text = "Unable to access location"
        }
    }
    
    @IBAction func searchByTextEntry(_ sender: Any) {
        /*
        if let searchEntry = locationTextEntry.text {
            if searchEntry.count > 2 {
                self.searchEntry = searchEntry
                view.endEditing(true)
                var events: [Event] = []
                DispatchQueue.main.async {
                    self.searchByLocation() { finalEvents in
                        DispatchQueue.main.async {
                            events = self.events
                            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "searchTableView") as? SearchViewController else {
                                fatalError("Could not load view controller from storyboard")
                            }
                            viewController.events = events
                            self.navigationController?.pushViewController(viewController, animated: true)
                        }
                    }
                }
            } else {
                let alert = UIAlertController(title: "Please Enter more than two characters of text", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Please enter a value to search", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
 */
    }
    
    @IBAction func searchByCurrentLocation(_ sender: Any) {
        view.endEditing(true)
        var events: [Event] = []
        DispatchQueue.main.async {
            self.searchByCurrentLocationResults() { finalEvents in
                DispatchQueue.main.async {
                    events = self.events
                    guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "searchTableView") as? SearchViewController else {
                        fatalError("Could not load view controller from storyboard")
                    }
                    viewController.events = events
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        }
    }
    
    func searchByCurrentLocationResults(completion: @escaping ([Event]) -> Void) {
        let handlingOfSkiddle = HandlingOfSkiddle()
        self.events = []
        let urlSkiddle = handlingOfSkiddle.createUrlForLocation()!
        handlingOfSkiddle.createJsonString(urlEntry: urlSkiddle) { finalEvents in
            self.events += finalEvents
            completion(self.events)
        }
    }
}
