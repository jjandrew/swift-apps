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
    
    /*private enum CodingKeys: String, CodingKey {
        case count = "totalcount"
        case results
    }
 */
}
