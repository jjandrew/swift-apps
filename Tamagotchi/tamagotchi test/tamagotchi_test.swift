//
//  tamagotchi_test.swift
//  tamagotchi test
//
//  Created by Andrew, James (NA) on 19/11/2019.
//  Copyright © 2019 Andrew, James (NA). All rights reserved.
//

import XCTest

class tamagotchi_test: XCTestCase {
    
    func testTamagotchiWothNoArgumentsReturnsNonNilObjectWithDefaultValuesSet() {
        //arrange
        //act
        let tamagotchi = Tamagotchi()
        //assert
        XCTAssertNotNil(tamagotchi)
        XCTAssertEqual(Tamagotchi.lifespan, 26)
        
    }
    
    func testTamagotchiCheckDeadReturnsTrueIfAgeIsGreaterThanLifespan() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.age = 30
        
        //act
        let actual = tamagotchi.checkDeathByAge()
        
        //assert
        XCTAssertTrue(actual)
    }
    
    func testTamagotchiCheckDeadReturnFalseIfAgeIsLessThanLifespan() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.age = 8
        
        //act
        let actual = tamagotchi.checkDeathByAge()
        
        //assert
        XCTAssertFalse(actual)
    }
    
    func testTamagotchiCheckDeadReturnTrueIfHeartsAreZero() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.health = 0
        
        //act
        let actual = tamagotchi.checkDeathByHearts()
        
        //assert
        XCTAssertTrue(actual)
    }
    
    func testTamagotchiCheckDeadReturnsFalseIfHeartsAreZero() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.health = 4
        
        //act
        let actual = tamagotchi.checkDeathByHearts()
        
        //assert
        XCTAssertFalse(actual)
    }
    
    func testHealthCantBeMoreThan5() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.health = 7
        
        //act
        let actual = tamagotchi.makeSureHealthCantBeMoreThan5()
        
        //assert
        XCTAssertEqual(actual, 5)
    }
    
    func testHealthCanBeLessThan5() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.health = 3
        
        //act
        let actual = tamagotchi.makeSureHealthCantBeMoreThan5()
        
        //assert
        XCTAssertEqual(actual, 3)
    }
}
