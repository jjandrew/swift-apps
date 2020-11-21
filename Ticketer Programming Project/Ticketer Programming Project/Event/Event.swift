//
//  Event.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 20/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation
import UIKit

class Event {
    let eventName : String
    let venue: EventVenue
    let date: String
    var dateInt: Int
    var description: String
    var saved: Bool?
    var website: [String]
    
    init(eventName: String, venue: EventVenue, date: String, description: String, saved: Bool?, website: [String]) {
        self.eventName = eventName
        self.venue = venue
        self.date = date
        self.description = description
        self.saved = saved
        self.website = website
        self.dateInt = 0
        dateIntConversion()
    }
    
    func dateIntConversion() {
        let dateArray = self.date.split(separator: "/")
        self.dateInt = Int(dateArray[2]+dateArray[1]+dateArray[0])!
    }

}

//    var image: UIImage?
//    var demographic: Demographic?
