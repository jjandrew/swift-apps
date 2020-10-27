//
//  HandlingOfStudhub.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 21/10/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class HandlingOfStudhub {
    let baseUrl = "https://api.stubhub.com/sellers/search/events/v3?"
    let apiKey = "8L7GQ9U3pO2IgGBe0hD5JqHhSTFW"
    let decoder = JSONDecoder()
    var jsonString = ""
    var studhubEvents: StudhubEventResponse? = nil
    var events: [Event] = []
    let headers: HTTPHeaders = [
        "Authorization": "Bearer 8L7GQ9U3pO2IgGBe0hD5JqHhSTFW",
        "Accept": "application/json"
    ]

    
    func createUrl(term: String?) -> String? {
        guard let searchTerm = term else {
            print("No search term provided")
            return nil}
        
        let path = "name=\(searchTerm)/".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = baseUrl + path
        return url
    }
    
    func createJsonString(urlEntry: String, completion: @escaping ([Event]) -> Void) {
        if let url = URL(string: urlEntry) {
            AF.request(url, method: .get, headers: headers).validate().responseJSON { response in
                print("")
                switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        let jsonData = try! json.rawData()
                        self.jsonString = json.description
                         
                        if let response = self.parsingJson(json: jsonData) {
                            self.studhubEvents = response
                            if let events = (self.studhubEvents?.convertToEventClass()) {
                                self.events = events
                                print("CJS", self.events.count)
                            }
                        }

                    case .failure(let error):
                        print("oops")
                        print(error)
                        self.events = []
                    }
            }
        } else {
            print("Error creating URL")
            self.events = []
        }
        completion(self.events)
    }
    
    func parsingJson(json: Data) -> StudhubEventResponse? {
        if let eventResponse = try?decoder.decode(StudhubEventResponse.self, from: json) {
            return eventResponse
        } else {
            print("Failed to decode to Event Response")
            return nil
        }
    }
}
