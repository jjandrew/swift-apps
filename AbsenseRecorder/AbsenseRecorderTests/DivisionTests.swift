//
//  DivisionTests.swift
//  AbsenseRecorderTests
//
//  Created by JJ Andrew on 08/03/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import XCTest

class DivisionTests: XCTestCase {

    func testGetAbsenceWithDateRetrievesExistingAbsenceOnSameDay() {
        //arrange
        let division = Division(code: "TestDiv")
        let absence = Absence(date: Date())
        division.absences.append(absence)
        let dateLaterToday = Date(timeIntervalSinceNow: 100)
        //act
        let actual = division.getAbsence(for: dateLaterToday)
        //assert
        XCTAssertNotNil(actual)
    }

}
