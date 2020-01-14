//
//  Tamagotchi_AppTests.swift
//  Tamagotchi AppTests
//
//  Created by Andrew, James (NA) on 14/01/2020.
//  Copyright © 2020 Andrew, James (NA). All rights reserved.
//

import XCTest
@testable import Tamagotchi_App

class Tamagotchi_AppTests: XCTestCase {

    func testTamagotchiValuesAreChanged() {
        let tamagotchi = Tamagotchi(name: "Carl", age: 1, health: 5, discipline: 50, weight: 50, hunger: 5)
        let expected = """
        Name: Carl
        Age: 1
        Health: 5
        Discipline 50
        Weight: 50
        Hunger: 5
        """
        let actual = tamagotchi.displayStats()
        
        XCTAssertEqual(actual,expected)
    }

}
