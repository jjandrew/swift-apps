//
//  ITunesAdaptor.swift
//  MusicByLocation
//
//  Created by JJ Andrew on 04/03/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class ITunesAdaptor {
    let baseUrl = "https://itunes.apple.com"
    let decoder = JSONDecoder()
    
    func getArtists(search: String?, completion: @escaping ([Artist]?) -> Void) {
        guard let search = search else {
            print("No search term provided terminting request")
            return }
        
        let path = "/term=\(search)&entitu=musicArtist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: baseUrl + path) else {
                print("Invalid URL")
                completion(nil)
                return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data,response, error) in
            //what is an escape enclosure is this the outside closure?
            //when do we use escape enclosures
            if let data = data {
                if let response = self.parseJson(json: data) {
                    completion(response.results)
                }
            }
        }.resume()
    }
    
    func parseJson (json: Data) -> ArtistResponse? {
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Failed to decode to Artist Response")
            return nil
        }
    }
    
}
