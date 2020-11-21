//
//  SkiddleVenues.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 28/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

struct SkiddleVenues: Codable {
    var name: String
    var address: String
    var town: String
    var postcode_lookup: String
    var postcode: String
    var country: String
    var phone: String
    var latitude: Float
    var longitude: Float
    
    /*
    let city: String
    let venueConfigName: String
    let state: String
    let name: String
    let longitude: Float
    let latitude: Float
    let postalCode: String
    let country:String
     
     "venueConfigName" : "Parking Lots - Dynamic",
     "city" : "Cincinnati",
     "postalCode" : "45202",
     "state" : "OH",
     "latitude" : 39.098002000000001,
     "name" : "Heritage Bank Center Parking Lots",
     "venueConfigId" : 1228705,
     "id" : 440477,
     "longitude" : -84.504502000000002,
     "country" : "US"
     
     name, city, country, postalCode
     
     name, town, country, postcode
     
      */
}
