//
//  SkiddleVenues.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 28/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

struct SkiddleVenues: Codable {
    var id: Int
    var name: String
    var address: String
    var town: String
    var postcode_lookup: String
    var postcode: String
    var country: String
    var phone: String
    var lattitude: Float
    var longitude: Float
    var type: String
    var rating: Int
}
