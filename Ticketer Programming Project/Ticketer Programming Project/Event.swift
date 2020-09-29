//
//  Event.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 20/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation
import UIKit

struct Event: Codable {
    let eventName : String
    let location: String?
    let date: String
    var description: String
//    var image: UIImage?
//    var demographic: Demographic?
    var saved: Bool?
    var website: [String]
    
    init(eventName: String, location: String?, date: String, description: String, saved: Bool?, website: [String]) {
        self.eventName = eventName
        self.location = location
        self.date = date
        self.description = description
//        self.image = image
//        self.demographic = demographic
        self.saved = saved
        self.website = website
    }

}
