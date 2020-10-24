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
                        print(json)
                        if let response = self.parsingJson(json: json) {
                            self.studhubEvents = response
                            if let events = (self.studhubEvents?.convertToEventClass()) {
                                self.events = events
                                print("CJS", self.events.count)
                            }
                        }

                    case .failure(let error):
                        print("oops")
                        print(error)
                    }
            }
        } else {
            print("Error creating URL")
        }
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
                                    self.studhubEvents = response
                                    //if let events = (self.studhubEvents?.convertToEventClass()) {
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
    func parsingJson(json: Data) -> StudhubEventResponse? {
        if let eventResponse = try?decoder.decode(StudhubEventResponse.self, from: json) {
            return eventResponse
        } else {
            print("Failed to decode to Event Response")
            return nil
        }
    }
}
