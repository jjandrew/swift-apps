//
//  Absence.swift
//  AbsenseRecorder
//
//  Created by JJ Andrew on 05/02/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class Absence {
    var takenOn: Date
    var present: [Student] = []
    var absent: [Student] = []
    
    init(date: Date) {
        takenOn = date
    }
}
