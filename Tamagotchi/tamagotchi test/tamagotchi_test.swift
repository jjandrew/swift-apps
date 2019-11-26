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
        let actual = tamagotchi.deathByAge()
        
        //assert
        XCTAssertTrue(actual)
    }
    
    func testTamagotchiCheckDeadReturnFalseIfAgeIsLessThanLifespan() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.age = 8
        
        //act
        let actual = tamagotchi.deathByAge()
        
        //assert
        XCTAssertFalse(actual)
    }
    
    func testTamagotchiCheckDeadReturnTrueIfHeartsAreZero() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.health = 0
        
        //act
        let actual = tamagotchi.deathByHearts()
        
        //assert
        XCTAssertTrue(actual)
    }
    
    func testTamagotchiCheckDeadReturnsFalseIfHeartsAreZero() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.health = 4
        
        //act
        let actual = tamagotchi.deathByHearts()
        
        //assert
        XCTAssertFalse(actual)
    }
    
    func testHealthCantBeMoreThan5() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.health = 7
        
        //act
        let actual = tamagotchi.healthWithinRange()
        
        //assert
        XCTAssertEqual(actual, 5)
    }
    
    func testHealthCanBeLessThan5() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.health = 3
        
        //act
        let actual = tamagotchi.healthWithinRange()
        
        //assert
        XCTAssertEqual(actual, 3)
    }
    
    func testDisciplineCanBeLessThan100AndMoreThan0() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.discipline = 60
        
        //act
        let actual = tamagotchi.disciplineWithinRange()
        
        //assert
        XCTAssertEqual(actual, 60)
    }
    
    func testDisciplineCantBeMoreThan100() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.discipline = 150
        
        //act
        let actual = tamagotchi.disciplineWithinRange()
        
        //assert
        XCTAssertEqual(actual, 100)
    }
    
    func testDisciplineCantBeLessThan0() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.discipline = -50
        
        //act
        let actual = tamagotchi.disciplineWithinRange()
        
        //assert
        XCTAssertEqual(actual, 0)
    }
    
    func checkBirthdayFunction() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.age = 2
        
        //act
        let actual = tamagotchi.birthday()
        
        //assert
        XCTAssertEqual(actual, 3)
    }
    
    func testHungerCanBeLessThan10AndMoreThan0() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.hunger = 7
        
        //act
        let actual = tamagotchi.hungerWithinRange()
        
        //assert
        XCTAssertEqual(actual, 7)
    }
    
    func testHungereCantBeMoreThan100() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.hunger = 150
        
        //act
        let actual = tamagotchi.hungerWithinRange()
        
        //assert
        XCTAssertEqual(actual, 10)
    }
    
    func testHungerCantBeLessThan0() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.hunger = -50
        
        //act
        let actual = tamagotchi.hungerWithinRange()
        
        //assert
        XCTAssertEqual(actual, 0)
    }
}
