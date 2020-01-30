//
//  DivisionFactory.swift
//  AbsenseRecorder
//
//  Created by JJ Andrew on 30/01/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class DivisionFactory {
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        var studentArray = [String]()
        for _ in(0...size-1) {
            let student = Student(forename: "JJ", surname: "Andrew", birthday: Date())
            studentArray.append(student.forename)
        }
//        division.students  = studentArray
        print(studentArray, division.code, studentArray.count)
        
        return division
    }
}
