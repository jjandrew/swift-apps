//
//  Student.swift
//  AbsenseRecorder
//
//  Created by JJ Andrew on 30/01/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class Student:Equatable {
    
    let forename: String
    let surname: String
    let birthday: Date
    
    init(forename: String, surname: String, birthday: Date) {
        self.forename = forename
        self.surname = surname
        self.birthday = birthday
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.forename == rhs.forename && lhs.surname == rhs.surname && lhs.birthday == rhs.birthday
    }
    
}
