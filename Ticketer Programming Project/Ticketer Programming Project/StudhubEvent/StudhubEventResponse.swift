//
//  StudhubEventResponse.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 21/10/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

struct StudhubEventResponse: Decodable {
    var numFound: Int
    var events: [StudhubEvent]
    
    func convertToEventClass() -> [Event] {
        var events: [Event] = []
        if self.events.count > 0 {
            for i in (0 ..< self.events.count) {
                let eventName = self.events[i].eventname
                let date = self.events[i].date
                let description = self.events[i].description
                let website = self.events[i].link
                events.append(Event(eventName: eventName, location: nil, date: date, description: description, saved: nil, website: [website]))
            }
            return events
        } else {
            return []
        }
    }
}
