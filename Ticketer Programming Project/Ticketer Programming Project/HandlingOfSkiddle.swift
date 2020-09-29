//
//  ProfileViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 27/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HandlingOfSkiddle {
    let baseUrl = "https://www.skiddle.com/api/v1/events/search/?"
    let apiKey = "api_key=52f07458a25911d3e1b89ab9f7f0c448"
    let decoder = JSONDecoder()
    var jsonString = ""

    
    func createUrl(term: String?) -> String? {
        guard let searchTerm = term else {
            print("No search term provided")
            return nil}
        
        let path = "&keyword=\(searchTerm)&order=date&description=1".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = baseUrl + apiKey + path
        return url
    }
    
    
    func createJsonString(urlEntry: String) {
        if let url = URL(string: urlEntry) {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                 if let jsonString = String(data: data, encoding: .utf8) {
                    print("")
                    self.jsonString = jsonString
                    let json = JSON(jsonString)
                    print(json)
                    if let response = self.parsingJson(json: data) {
                        print(response.results[0].eventname)
                    }
                 } else {
                    print("Error creating json string")
                 }
               }
           }.resume()
        } else {
            print("Error creating url")
        }
    }
    
    
    
    func parsingJson(json: Data) -> SkiddleEventResponse? {
        if let eventResponse = try? decoder.decode(SkiddleEventResponse.self, from: json) {
            return eventResponse
        } else {
            print("Failed to decode to Event Response")
            return nil
        }
    }
}
/*
    func parseJson() {
        var skiddleEvent: SkiddleEvent?
        do {
            skiddleEvent = try JSONDecoder().decode(SkiddleEvent.self, from: Data(self.jsonString.utf8))
        } catch {
            print("Decoding Error")
        }
        
        print(jsonString)
    }

    func searchByName() -> [Event]? {
        return nil
    }
}

struct SuperSkiddleEvent: Decodable {
    let error: Int
    let totalCount: String
    let pageCount: Int
    let results: [SkiddleEvent]
}

struct SkiddleEvent {
    
    let id : String
    let EventCode: String
    let eventname: String
    var cancelled: String
    var cancellationDate: String
    var cancellationType: String
    let cancellationReason: String
    let rescheduledDate: String
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
    var venue: [String: Any]
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
*/
