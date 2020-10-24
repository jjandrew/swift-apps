//
//  HandlingOfTicketMaster.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 21/10/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class HandlingOfTicketMaster {
    let baseUrl = "https://app.ticketmaster.com/discovery/v2/events.json?"
    let apiKey = "&api_key={0URy7rbQGi9UscAHL7dnRQhn1Wol9hwi}"
    let decoder = JSONDecoder()
    var jsonString = ""
    var ticketMasterEvents: TicketMasterEventResponse? = nil
    var events: [Event] = []

    
    func createUrl(term: String?) -> String? {
        guard let searchTerm = term else {
            print("No search term provided")
            return nil}
        
        let path = "&keyword=\(searchTerm)&order=date&description=1".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = baseUrl + apiKey + path
        return url
    }
    
    /*
     
     
    func createJsonString(urlEntry: String, completion: @escaping ([Event]) -> Void) {
        if let url = URL(string: urlEntry) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                } else {
                    if let data = data {
                            if let jsonString = String(data: data, encoding: .utf8) {
                                self.jsonString = jsonString
                                print(jsonString)
                                let _ = JSON(jsonString)
                                if let response = self.parsingJson(json: data) {
                                    self.ticketMasterEvents = response
                                    if let events = (self.ticketMasterEvents?.convertToEventClass()) {
                                        self.events = events
                                        print("CJS", self.events.count)
                                    }
                                }
                            } else {
                                print("Error creating json string")
                            }
                    }
                }
                completion(self.events)
            }.resume()
                
        } else {
            print("Error creating URL")
        }
    }
 */
    
    func parsingJson(json: Data) -> TicketMasterEventResponse? {
        if let eventResponse = try?decoder.decode(TicketMasterEventResponse.self, from: json) {
            return eventResponse
        } else {
            print("Failed to decode to Event Response")
            return nil
        }
    }
}
