//
//  SkiddleEvent.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 21/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

struct SkiddleEvent: Decodable {
    

    var id : String
    var EventCode: String
    var eventname: String
    var cancelled: String
    var cancellationDate: String
    var cancellationType: String
    var cancellationReason: String
    var rescheduledDate: String
    //var venue: [String: Any]
    /*
     var id: Int
     var name: String
     var address: String
     var town: String
     var postcode_lookup: Sheffield
     var postcode: String
     var country: String
     var phone: String
     var lattitude: Float
     var longitude: Float
     var type: String
     var rating: Int
     */
    var imageurl: String
    var largeimageurl: String
    var link: String
    var date: String
    var startdate: String
    var enddate: String
    var description: String
    /*
     var openingtimes: [SkiddleOpeningTimes]
     var doorsopen: String
     var doorsclose: String
     var lastentry: String
     */

     var minage: String
     var imgoing: String?
     var goingtos: Int
     var goingtocount: String
     var tickets: Bool
     var entryprice: String
     var eventvisibility: String
     //var rep: [String: Any]
    /*
     var enabled: Bool
     */
    var artists: [SkiddleArtist]
    var genres: [SkiddleGenres]
    
}
    


 
