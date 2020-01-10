//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by JJ Andrew on 10/01/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import XCTest
@testable import CarCustomiser

class CarCustomiserTests: XCTestCase {

    func testCarGetStatsAsPerPropertyValues() {
        //arange
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 100, acceleration: 7.5, handling: 3)
        let expected = """
        Make: Mazda
        Model: MX-5
        Top Speed: 100mph
        Acceleration (0-60 in): 7.5s
        Handling: 3
        """
        //act
        let actual = car.displayStats()
        //assert
        XCTAssertEqual(actual, expected)
        
    }
}
