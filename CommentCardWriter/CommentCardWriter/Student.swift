//
//  Student.swift
//  CommentCardWriter
//
//  Created by Andrew, James (NA) on 11/02/2020.
//  Copyright © 2020 Andrew, James (NA). All rights reserved.
//

import Foundation

class Student {
    
    var name: String
    var subjects: [Subject]
    
    init(name: String, subjects: [Subject]) {
        self.name = name
        self.subjects = subjects
    }
    
}
