//
//  SavedEventsTableViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 27/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit
import Firebase

class SavedEventsTableViewController: UITableViewController {

    var events: [Event] = []
    let sortAndSearch = SortAndSearch()
    @IBOutlet var sortOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sorts events by name when view loads
        self.events = sortAndSearch.quickSortByName(array: self.events)
        eventSearchStruct.events = self.events
        self.events = sortAndSearch.checkEventsAreDifferent(events: events)
        tableView.reloadData()
        sortOutlet.setTitle("Sort By Date", for: .normal)
        for event in self.events {
            event.createIdentifier()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //sets text for each cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "interestedCell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(events[indexPath.row].eventName) \n\(events[indexPath.row].date)"
        return cell
    }
    
    @IBAction func sortAction(_ sender: Any) {
        if sortOutlet.currentTitle == "Sort By Date" {
            self.events = sortAndSearch.quickSortByDate(array: self.events)
            sortOutlet.setTitle("Sort By Name", for: .normal)
        } else {
            self.events = sortAndSearch.quickSortByName(array: self.events)
            sortOutlet.setTitle("Sort By Date", for: .normal)
        }
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //opens event vc
        guard let viewController = storyboard?.instantiateViewController(identifier: "eventScene") as? EventViewController else {
            fatalError("Couldn't load event view controller")
        }
        viewController.event = events[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //adds delete button on swipe of a row
        if editingStyle == .delete {
            let sortAndSearch = SortAndSearch()
            //delete from demographics
            var ref: DocumentReference!
            let db = Firestore.firestore()
            var demographic: Demographic? = nil
            //creation of identifier of event to be used for reference
            let position = sortAndSearch.eventLinearSearch(events: profile.savedEvents, searchEvent: events[indexPath.row]).0!
            profile.savedEvents[position].createIdentifier()
            let event = profile.savedEvents[position]
            //reads demographic from firestore
            ref = db.document("events/\(event.identifier)")
            ref.getDocument() { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    if querySnapshot?.data() == nil {
                        print("Event not present so cant be removed")
                        demographic = nil
                    } else {
                        let data = querySnapshot?.data()
                        print("Event present")
                        //create demographic instance
                        demographic = Demographic(event: event, numberFemaleInterested: data!["numberFemaleInterested"] as! Int, numberMaleInterested: data!["numberMaleInterested"] as! Int, numberOtherInterested: data!["numberOtherInterested"] as! Int, numberFemaleAttending: data!["numberFemaleAttending"] as! Int, numberMaleAttending: data!["numberMaleAttending"] as! Int, numberOtherAttending: data!["numberOtherAttending"] as! Int, totalAgeAttending: data!["totalAgeAttending"] as! Int, totalAgeInterested: data!["totalAgeInterested"] as! Int, totalAttending: data!["totalAttending"] as! Int, totalInterested: data!["totalInterested"] as! Int)
                        event.demographic = demographic
                        //unsaves document
                        event.demographic?.updateDocumentForUnsaved()
                    }
                }
            }
            
            profile.savedEvents.remove(at: sortAndSearch.eventLinearSearch(events: profile.savedEvents, searchEvent: events[indexPath.row]).0!)
            self.events = profile.savedEvents
            tableView.reloadData()
            
            //saves am event down to local storage
            let defaults = UserDefaults.standard
            if let convertedProfile = try? NSKeyedArchiver.archivedData(withRootObject: profile, requiringSecureCoding: false) {
                defaults.set(convertedProfile, forKey: "savedProfile")
            }
            if let convertedEvents = try? NSKeyedArchiver.archivedData(withRootObject: profile.savedEvents, requiringSecureCoding: false) {
                defaults.set(convertedEvents, forKey: "savedEvents")
            }
        }
    }

}
