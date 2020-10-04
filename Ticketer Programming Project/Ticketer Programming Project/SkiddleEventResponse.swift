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
        if self.error == 0 && Int(self.totalcount) ?? -1 > 0 {
            let i = Int(self.totalcount)!
                for j in (0..<i) {
                    print(j)
                    print(self.results[j].eventname)
                    let eventName = self.results[j].eventname
                    let date = self.results[j].date
                    let description = self.results[j].description
                    let website = self.results[j].link
                    events.append(Event(eventName: eventName, location: nil, date: date, description: description, saved: nil, website: [website]))
                }
                return events

        } else {
            return []
        }
    }
     
}
