//
//  SavedEventsTableViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 27/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class SavedEventsTableViewController: UITableViewController {

    var events: [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()
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
        cell.textLabel?.text = events[indexPath.row].eventName
        return cell
    }
    
    @IBAction func sortButton(_ sender: Any) {
        let sortAndSearch = SortAndSearch()
        self.events = sortAndSearch.quickSortByName(array: self.events)
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
            profile.savedEvents.remove(at: sortAndSearch.eventLinearSearch(events: profile.savedEvents, searchEvent: events[indexPath.row]).0!)
            self.events = profile.savedEvents
            tableView.reloadData()
            
            //saves am event down to local storage
            let defaults = UserDefaults.standard
            if let convertedProfile = try? NSKeyedArchiver.archivedData(withRootObject: profile, requiringSecureCoding: false) {
                defaults.set(convertedProfile, forKey: "savedProfile")
            }
        }
    }

}
