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
        let actual = tamagotchi.checkDead()
        
        //assert
        XCTAssertTrue(actual)
    }
    
    func testTamagotchiCheckDeadReturnFalseIfAgeIsLessThanLifespan() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.age = 8
        
        //act
        let actual = tamagotchi.checkDead()
        
        //assert
        XCTAssertFalse(actual)
    }
}
