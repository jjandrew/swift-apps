//
//  HomeScreenViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 15/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet var homeLabel: UILabel!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var currentLocationLabel: UILabel!
    @IBOutlet var searchByLocationButton: UIButton!
    @IBOutlet var eventsYouAreInterestedInLabel: UILabel!
    @IBOutlet var interestedEventsMore: UIButton!
    @IBOutlet var leftHandInterestedEvent: UILabel!
    @IBOutlet var rightHandInterestedEvent: UILabel!
    @IBOutlet var previousInterestedEvent: UIButton!
    @IBOutlet var nextInterestedEvent: UIButton!
    @IBOutlet var suggestedEventsLabel: UILabel!
    @IBOutlet var suggestedEventsMore: UIButton!
    @IBOutlet var leftHandSuggestedEvent: UILabel!
    @IBOutlet var rightHandSuggestedEvent: UILabel!
    @IBOutlet var previousSuggestedEvent: UIButton!
    @IBOutlet var nextSuggestedEvent: UIButton!
    
    let handlingOfSkiddle = HandlingOfSkiddle()
    var searchEntry: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftHandInterestedEvent.text = """
        Event Title
        
        Location
        
        Date
        
        Availability
        """
        rightHandInterestedEvent.text = """
        Event Title
                
        Location
                
        Date
                
        Availability
        """
        leftHandSuggestedEvent.text = """
        Event Title
                
        Location
                
        Date
                
        Availability
        """
        rightHandSuggestedEvent.text = """
        Event Title
                
        Location
                
        Date
                
        Availability
        """
        updateEventsByKeyword()
    }
    func updateEventsByKeyword() {
        if let url = handlingOfSkiddle.createUrl(term: "vivaldi") {
            handlingOfSkiddle.getJson(urlString: url)
        } else {
            print("Error")
        }
        
        /*handlingOfSkiddle.getEvents(name: "vivaldi") { (events) in
            DispatchQueue.main.async {
                let names = events?.map { return $0.eventName }
                print(names?.joined(separator: ", " ))
            }
        }
 */
    }
    
    func searchByName() {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Searched")
        if let searchEntry = searchBar.text {
            self.searchEntry = searchEntry
            view.endEditing(true)
            searchByName()
        } else {
            let alert = UIAlertController(title: "Please enter a value to search", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        print("cancelled")
    }
    
    @IBAction func searchByLocationAction(_ sender: Any) {
    }
    @IBAction func interestedPreviousAction(_ sender: Any) {
    }
    @IBAction func interestedNextAction(_ sender: Any) {
    }
    @IBAction func suggestedPreviousAction(_ sender: Any) {
    }
    @IBAction func suggestedNextAction(_ sender: Any) {
    }
}