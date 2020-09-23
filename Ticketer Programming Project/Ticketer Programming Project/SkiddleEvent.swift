//
//  SkiddleEvent.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 21/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

struct SkiddleEvent: Codable {
    let id : String
    let EventCode: String
    let eventname: String
    var cancelled: String
    var cancellationDate: String
    var cancellationType: String
    var venue: {String}
    //dictionary but how do you show ^^
    var imageurl: String
    var largeimageurl: String
    var link: String
    var date: String
    var startdate: String
    var enddate: String
    var description: String
    var openingtimes: {String}
    var minage: String
    var imgoing: None
    var goingtos: String
    var goingtocount: String
    var tickets: Bool
    
    
    
    

}
