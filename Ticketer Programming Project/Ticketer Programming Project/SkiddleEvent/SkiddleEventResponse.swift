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
     
    func convertToEventClass() -> [Event] {
        var events: [Event] = []
        if self.error == 0 && self.results.count > 0 {
            for i in (0 ..< self.results.count) {
                let eventName = self.results[i].eventname
                let dateSkiddle = self.results[i].date
                let dateArraySkiddle = dateSkiddle.split(separator: "-")
                let year = dateArraySkiddle[0]
                let month = dateArraySkiddle[1]
                let day = dateArraySkiddle[2]
                let date = "\(day)/\(month)/\(year)"
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
