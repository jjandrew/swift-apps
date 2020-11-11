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
                let eventName = self.events[i].name
                let dateStudhub = self.events[i].eventDateUTC
                let dateArrayStudhub = dateStudhub.split(separator: "-")
                let year = dateArrayStudhub[0]
                let month = dateArrayStudhub[1]
                let dayAndTime = dateArrayStudhub[2].split(separator: "T")
                let day = dayAndTime[0]
                let date = "\(day)/\(month)/\(year)"
                let description = self.events[i].description
                let website = "https://www.stubhub.co.uk/\(self.events[i].webURI)"
                events.append(Event(eventName: eventName, location: nil, date: date, description: description, saved: nil, website: [website]))
            }
            return events
        } else {
            return []
        }
    }
}
