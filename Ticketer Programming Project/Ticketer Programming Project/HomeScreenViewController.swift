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
    @IBOutlet var leftHandSuggestedEvent: UILabel!
    @IBOutlet var rightHandSuggestedEvent: UILabel!
    @IBOutlet var previousSuggestedEvent: UIButton!
    @IBOutlet var nextSuggestedEvent: UIButton!
    
    var profile = Profile(userName: "Firstname, Surname", userBirthday: "01/01/2003", userGender: "Male", userLocation: nil, userAge: 17, savedEvents: [], attendingEvents: [])
    
    var searchEntry: String = ""
    var events: [Event] = []
    
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

    }
    
    func searchByName(completion: @escaping ([Event]) -> Void) {
        let handlingOfSkiddle = HandlingOfSkiddle()
        let url = handlingOfSkiddle.createUrl(term: self.searchEntry)!
        handlingOfSkiddle.createJsonString(urlEntry: url) { finalEvents in
            self.events = finalEvents
            print("SBN", self.events.count)
            completion(self.events)
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
                            print("SBNB", events.count)
                            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "searchTableView") as? SearchTableViewController else {
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
    }
    @IBAction func interestedNextAction(_ sender: Any) {
    }
    @IBAction func suggestedPreviousAction(_ sender: Any) {
    }
    @IBAction func suggestedNextAction(_ sender: Any) {
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
