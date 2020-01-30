//
//  Division.swift
//  AbsenseRecorder
//
//  Created by JJ Andrew on 30/01/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class Division {
    let code: String
    var noOfStudents = 0
    var students: [Student] = []
//    var students = [Student(forename: "JJ", surname: "Andrew", birthday: Date()), Student(forename: "Sam", surname: "Barnham", birthday: Date()), Student(forename: "Seb", surname: "Wade", birthday: Date()), Student(forename: "Oscar", surname: "Hassel", birthday: Date())]
    
    init(code: String) {
        self.code = code
        var studentArray = [String]()
        for var student in students {
            noOfStudents += 1
        }
        if students.count > 0 {
        for i in(0...students.count) {
            print(students[i].forename)
        }
        }
        print(noOfStudents)
        print(code)
    }
}
