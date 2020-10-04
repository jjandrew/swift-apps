//
//  SkiddleEventResponse.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 20/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

struct SkiddleEventResponse: Decodable {
    var error: Int
    var totalcount: String = ""
    var pagecount: Int
    var results: [SkiddleEvent]
    
    /*private enum CodingKeys: String, CodingKey {
        case count = "totalcount"
        case results
    }
 */
    
     
     
    func convertToEventClass() -> [Event] {
        var events: [Event] = []
        if self.error == 0 && self.results.count > 0 {
        for i in (0 ..< self.results.count) {
                let eventName = self.results[i].eventname
                let date = self.results[i].date
                let description = self.results[i].description
                let website = self.results[i].link
                events.append(Event(eventName: eventName, location: nil, date: date, description: description, saved: nil, website: [website]))
            }
            return events
        } else {
            return []
        }
    }
     
}
