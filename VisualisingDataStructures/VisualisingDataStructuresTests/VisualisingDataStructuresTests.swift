//
//  VisualisingDataStructuresTests.swift
//  VisualisingDataStructuresTests
//
//  Created by Andrew, James (NA) on 28/01/2020.
//  Copyright © 2020 Andrew, James (NA). All rights reserved.
//

import XCTest
@testable import VisualisingDataStructures

class VisualisingDataStructuresTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPushAddsToTopOfStack() {
        var stackArray = [String]()
        for _ in (0...9) {
          stackArray.append("_")
        }
        var stack = Stack(maxSize: 10, top: -1, array: stackArray)
        
        stack.push(item: "13")
        stack.push(item: "j")
        let actual = stack.array
        let expected = ["13", "j", "_", "_", "_", "_", "_", "_", "_", "_"]
        
        XCTAssertEqual(actual, expected)
    }

    func testCheckPopRemovesTopItem() {
        
        var stack = Stack(maxSize: 10, top: -1, array: ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"])
        
        stack.push(item: "13")
        stack.push(item: "j")
        stack.pop()
        
        
        let actual = stack.top
        let expected = 0
        
        XCTAssertEqual(actual, expected)
    }

}
