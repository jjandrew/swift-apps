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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedButton.setImage(UIImage(systemName: "bookmark.fill"), for: .selected)
        savedButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        navigationItem.title = event.eventName
        dateLabel.text = event.date
        descriptionLabel.text = event.description
        
    }

    @IBAction func savedAction(_ sender: Any) {
        if savedButton.isSelected == true {
            savedButton.isSelected = false
        } else {
            savedButton.isSelected = true
        }
    }
}
