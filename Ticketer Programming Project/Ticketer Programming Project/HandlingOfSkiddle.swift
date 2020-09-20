//
//  HandlingOfSkiddle.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 20/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class handlingOfSkiddle {
    let baseUrl = "https://www.skiddle.com/api/v1/events/search/?"
    let apiKey = "api_key=52f07458a25911d3e1b89ab9f7f0c448"
    let decoder = JSONDecoder()
    
    func getEvents(name: String?, completion: @escaping ([Event]?) -> Void) {
        guard let name = name else {
            print("No search term provided terminting request")
            return }
        
        let path = "&keyword=\(name)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: baseUrl + apiKey + path) else {
                print("Invalid URL")
                completion(nil)
                return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data,response, error) in
            if let data = data {
                print(data)
                if let response = self.parseJson(json: data) {
                    completion(response.results)
                    print(response)
                    print(response.results)
                }
            }
        }.resume()
    }
    
    func parseJson (json: Data) -> SkiddleEventResponse? {
        if let eventResponse = try? decoder.decode(SkiddleEventResponse.self, from: json) {
            return eventResponse
        } else {
            print("Failed to decode to Event Response")
            return nil
        }
    }
}
