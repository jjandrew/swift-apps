//
//  tamagotchi_test.swift
//  tamagotchi test
//
//  Created by Andrew, James (NA) on 19/11/2019.
//  Copyright © 2019 Andrew, James (NA). All rights reserved.
//

import XCTest

class tamagotchi_test: XCTestCase {
    
    func testTamagotchiWothNoArgumentsReturnsNonNilObject() {
        //arrange
        //act
        let tamagotchi = Tamagotchi()
        //assert
        XCTAssertNotNil(tamagotchi)
    }
    
}
