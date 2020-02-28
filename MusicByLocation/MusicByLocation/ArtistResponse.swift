//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by JJ Andrew on 28/02/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results
    }
    
}
