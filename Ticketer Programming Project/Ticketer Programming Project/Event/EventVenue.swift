//
//  EventVenue.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 21/11/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class EventVenue {
    let name: String
    let town: String
    let country: String
    let postCode: String
    
    init(name: String, town: String, country: String, postCode: String) {
        self.name = name
        self.town = town
        self.country = country
        self.postCode = postCode
    }
}
