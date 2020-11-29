//
//  EventViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 04/10/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet var savedButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var venueLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var demographicLabel: UILabel!
    @IBOutlet var purchaseButton: UIButton!
    
    var event: Event!
    let sortAndSearch = SortAndSearch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets default values for opening view
        savedButton.setImage(UIImage(systemName: "bookmark.fill"), for: .selected)
        savedButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        navigationItem.title = event.eventName
        dateLabel.text = event.date
        descriptionLabel.text = event.summary
        venueLabel.text = """
        \(event.venue.name)
        \(event.venue.town)
        \(event.venue.country)
        \(event.venue.postCode)
        """
        if sortAndSearch.eventLinearSearch(events: profile.savedEvents, searchEvent: event).1 == true {
            savedButton.isSelected = true
        }
    }

    @IBAction func savedAction(_ sender: Any) {
        //saves and unsaves the event
        if savedButton.isSelected == true {
            //checks location of event in savedEvents
            profile.savedEvents.remove(at: sortAndSearch.eventLinearSearch(events: profile.savedEvents, searchEvent: event).0!)
            savedButton.isSelected = false
        } else {
            savedButton.isSelected = true
            profile.savedEvents.append(event)
        }
        //saves event to local storage
        let defaults = UserDefaults.standard
        if let convertedProfile = try? NSKeyedArchiver.archivedData(withRootObject: profile, requiringSecureCoding: false) {
            defaults.set(convertedProfile, forKey: "savedProfile")
        }
        if let convertedEvents = try? NSKeyedArchiver.archivedData(withRootObject: profile.savedEvents, requiringSecureCoding: false) {
            defaults.set(convertedEvents, forKey: "savedEvents")
        }
    }
    
    @IBAction func purchaseAction(_ sender: Any) {
        //checks event is present in attending events
        if sortAndSearch.eventLinearSearch(events: profile.attendingEvents, searchEvent: event).1 == false {
            profile.attendingEvents.append(event)
        }
        //stores profile in local storage
        let defaults = UserDefaults.standard
        if let convertedProfile = try? NSKeyedArchiver.archivedData(withRootObject: profile, requiringSecureCoding: false) {
            defaults.set(convertedProfile, forKey: "savedProfile")
        }
        //opens website in safari
        let website = self.event.website[0]
        UIApplication.shared.open(URL(string: website)!)
    }
}
