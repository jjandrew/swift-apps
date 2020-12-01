//
//  OpenLoginScreenViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 29/11/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit
import Firebase

class OpenLoginScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let demographic = Demographic(event: Event(eventName: "", venue: EventVenue(name: "", town: "", country: "", postCode: ""), date: "", description: "", saved: true, website: []), numberFemaleInterested: 5, numberMaleInterested: 7, numberOtherInterested: 3, numberFemaleAttending: 2, numberMaleAttending: 4, numberOtherAttending: 0, totalAgeAttending: 133, totalAgeInterested: 227, totalAttending: 6, totalInterested: 15)
        print("average age interested")
        print(demographic.calculateAverageAgeInterested())
        print("")
        print("average age Attending")
        print(demographic.calculateAverageAgeAttending())
        print("")
        print("Interested percentages: [malePercentage, femalePercentage, otherPercentage]")
        print(demographic.calculateInterestedPercentages())
        print("")
        print("Attending percentages: [malePercentage, femalePercentage, otherPercentage]")
        print(demographic.calculateAttendingPercentages())

    }
    
}
