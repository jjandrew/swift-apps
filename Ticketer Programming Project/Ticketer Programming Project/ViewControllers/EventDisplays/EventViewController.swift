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
        savedButton.setImage(UIImage(systemName: "bookmark.fill"), for: .selected)
        savedButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        navigationItem.title = event.eventName
        dateLabel.text = event.date
        descriptionLabel.text = event.description
        if sortAndSearch.eventLinearSearch(events: profile.savedEvents, searchEvent: event).1 == true {
            savedButton.isSelected = true
        }
            
        
    }

    @IBAction func savedAction(_ sender: Any) {
        if savedButton.isSelected == true {
            profile.savedEvents.remove(at: sortAndSearch.eventLinearSearch(events: profile.savedEvents, searchEvent: event).0!)
            savedButton.isSelected = false
        } else {
            savedButton.isSelected = true
            profile.savedEvents.append(event)
        }
    }
    
    @IBAction func purchaseAction(_ sender: Any) {
        if sortAndSearch.eventLinearSearch(events: profile.attendingEvents, searchEvent: event).1 == false {
            profile.attendingEvents.append(event)
        }
    }
}
