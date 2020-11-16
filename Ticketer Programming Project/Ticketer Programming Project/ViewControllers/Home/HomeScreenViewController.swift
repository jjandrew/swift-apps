//
//  HomeScreenViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 15/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet var nameTextEntry: UITextField!
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
    @IBOutlet var leftHandAttendingEvent: UILabel!
    @IBOutlet var rightHandAttendingEvent: UILabel!
    @IBOutlet var previousAttendingEvent: UIButton!
    @IBOutlet var nextAttendingEvent: UIButton!
    
    var searchEntry: String = ""
    var events: [Event] = []
    
    var savedIndex = 0
    var attendingIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedIndex = 0
        attendingIndex = 0
        displaySavedEvents(index: savedIndex)
        displayAttendingEvents(index: attendingIndex)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        savedIndex = 0
        attendingIndex = 0
        displaySavedEvents(index: savedIndex)
        displayAttendingEvents(index: attendingIndex)
    }
    
    func searchByName(completion: @escaping ([Event]) -> Void) {
        let handlingOfStudhub = HandlingOfStudhub()
        self.events = []
        var completions = 0
        let urlStudhub = handlingOfStudhub.createUrl(term: self.searchEntry)!
        handlingOfStudhub.createJsonString(urlEntry: urlStudhub) { finalEvents in
            self.events += finalEvents
            completions += 1
            let handlingOfSkiddle = HandlingOfSkiddle()
           let urlSkiddle = handlingOfSkiddle.createUrl(term: self.searchEntry)!
           handlingOfSkiddle.createJsonString(urlEntry: urlSkiddle) { finalEvents in
               self.events += finalEvents
               completions += 1
                completion(self.events)
           }
        }  
    }
    
    @IBAction func searchByNameButton(_ sender: Any) {
        if let searchEntry = nameTextEntry.text {
            if searchEntry.count > 2 {
                self.searchEntry = searchEntry
                view.endEditing(true)
                var events: [Event] = []
                DispatchQueue.main.async {
                    self.searchByName() { finalEvents in
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
    }
    
    @IBAction func searchByLocationAction(_ sender: Any) {
    }
    @IBAction func interestedPreviousAction(_ sender: Any) {
        savedIndex -= 1
        displaySavedEvents(index: savedIndex)
    }
    @IBAction func interestedNextAction(_ sender: Any) {
        savedIndex += 1
        displaySavedEvents(index: savedIndex)
    }
    @IBAction func attendingPreviousAction(_ sender: Any) {
        attendingIndex -= 1
        displayAttendingEvents(index: attendingIndex)
    }
    @IBAction func attendingNextAction(_ sender: Any) {
        attendingIndex += 1
        displayAttendingEvents(index: attendingIndex)
    }
    
    func displaySavedEvents(index: Int) {
        if profile.savedEvents.count > index+1 {
            leftHandInterestedEvent.text = """
            \(profile.savedEvents[index].eventName)
            
            Venue
            
            \(profile.savedEvents[index].date)
            """
            
            rightHandInterestedEvent.text = """
            \(profile.savedEvents[index+1].eventName)
            
            Venue
            
            \(profile.savedEvents[index+1].date)
            """
        } else if profile.savedEvents.count > index {
            leftHandInterestedEvent.text = """
            \(profile.savedEvents[index].eventName)
            
            Venue
            
            \(profile.savedEvents[index].date)
            """
            
            rightHandInterestedEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
        } else {
            leftHandInterestedEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
            
            rightHandInterestedEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
        }
        if index == 0 {
            previousInterestedEvent.isEnabled = false
        } else {
            previousInterestedEvent.isEnabled = true
        }
        if profile.savedEvents.count <= index+2 {
            nextInterestedEvent.isEnabled = false
        } else {
            nextInterestedEvent.isEnabled = true
        }
    }
    
    func displayAttendingEvents(index: Int) {
        if profile.attendingEvents.count > index+1 {
            leftHandAttendingEvent.text = """
            \(profile.attendingEvents[index].eventName)
            
            Venue
            
            \(profile.attendingEvents[index].date)
            """
            
            rightHandAttendingEvent.text = """
            \(profile.attendingEvents[index+1].eventName)
            
            Venue
            
            \(profile.attendingEvents[index+1].date)
            """
        } else if profile.attendingEvents.count > index {
            leftHandAttendingEvent.text = """
            \(profile.attendingEvents[index].eventName)
            
            Venue
            
            \(profile.attendingEvents[index].date)
            """
            
            rightHandAttendingEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
        } else {
            leftHandAttendingEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
            
            rightHandAttendingEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
        }
        if index == 0 {
            previousAttendingEvent.isEnabled = false
        } else {
            previousAttendingEvent.isEnabled = true
        }
        if profile.attendingEvents.count <= index+2 {
            nextAttendingEvent.isEnabled = false
        } else {
            nextAttendingEvent.isEnabled = true
        }
    }
    
    /*
     
    internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchEntry = searchBar.text {
            if searchEntry.count > 2 {
                self.searchEntry = searchEntry
                view.endEditing(true)
                searchByName()
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
    }
    internal func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
 
     */
}
