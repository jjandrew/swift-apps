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
        handlingOfSkiddle.getEvents(name: "vivaldi") { (events) in
            DispatchQueue.main.async {
                let names = events?.map { return $0.eventname }
                print(names?.joined(separator: ", " ))
            }
        }
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
