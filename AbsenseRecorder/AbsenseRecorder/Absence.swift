//
//  Absence.swift
//  AbsenseRecorder
//
//  Created by JJ Andrew on 05/02/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class Absence: Codable {
    var takenOn: Date
    var absent: [Student] = []
    
    init(date: Date) {
        takenOn = date
    }
    
    init(date: Date, absent: [Student]) {
        takenOn = date
        self.absent = absent
    }
}
