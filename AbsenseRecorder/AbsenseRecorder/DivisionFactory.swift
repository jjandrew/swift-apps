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
        
        for i in 1...size {
            let student = Student(forename: "JJ\(i)", surname: "Andrew\(i)", birthday: Date.init())
            division.students.append(student)
        }

        return division
    }
}
