//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Andrew, James (NA) on 11/02/2020.
//  Copyright © 2020 Andrew, James (NA). All rights reserved.
//

import Foundation

class Comment {
    var enjoyment: Int
    var progress: Int
    var challenges: [String]
    
    init(enjoyment: Int, progress: Int, challenges: [String]) {
        self.enjoyment = enjoyment
        self.progress = progress
        self.challenges = challenges
    }
}
