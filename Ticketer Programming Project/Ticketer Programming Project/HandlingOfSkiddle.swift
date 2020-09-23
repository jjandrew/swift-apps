//
//  HandlingOfSkiddle.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 20/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HandlingOfSkiddle {
    let baseUrl = "https://www.skiddle.com/api/v1/events/search/?"
    let apiKey = "api_key=52f07458a25911d3e1b89ab9f7f0c448"
    let decoder = JSONDecoder()
    
    func createUrl(searhTerm: String?) -> String {
        guard let searchTerm = searchTerm else {
            print("No search term provided terminating request")
            return }
        
        let path = "&keyword=\(search)&order=date&description=1".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: baseUrl + apiKey + path) else {
                print("Invalid URL")
                completion(nil)
                return
        }
        return url
    }
    
    
    
    
    func getEvents(name: String?, completion: @escaping ([SkiddleEvent]?) -> Void) {
        guard let name = name else {
            print("No search term provided terminting request")
            return }
        
        let path = "&keyword=\(name)&order=date&description=1".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: baseUrl + apiKey + path) else {
                print("Invalid URL")
                completion(nil)
                return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data,response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    completion(response.results)
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
    
    func almofireJson(url: String) {
        Alamofire.request(.GET, url).validate().responseJSON {
            response in switch response.result {
                case .Success:
                    if let json = response.result.value {
                        let finalJson = JSON(json)
                        print("JSON: \(finalJson)")
                        print(finalJson[0]["eventname"])
                    }
                case .Failure(let error):
                    print(error)
            }
        }
    }
}
