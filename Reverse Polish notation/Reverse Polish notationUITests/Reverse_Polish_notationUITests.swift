//
//  Reverse_Polish_notationUITests.swift
//  Reverse Polish notationUITests
//
//  Created by JJ Andrew on 08/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import XCTest

class Reverse_Polish_notationUITests: XCTestCase {

    func testPlusButtonAddsToNumberEntry() {
        let app = XCUIApplication()
        app.launch()
        let viewController = UIViewController()
        
        app.buttons["0"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        
        //XCTAssertEqual(numberEntry, "0123456789")
    }
    
    func testPlusButtonAddsToNumberEntr() {
        let app = XCUIApplication()
        app.launch()
        let viewController = UIViewController()
        
        app.buttons["0"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        
        //XCTAssertEqual(numberEntry, "0123456789")
    }
    
    func checkAllButtonsExist() {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.alerts["0"].exists)
        XCTAssertTrue(app.alerts["1"].exists)
        XCTAssertTrue(app.alerts["2"].exists)
        XCTAssertTrue(app.alerts["3"].exists)
        XCTAssertTrue(app.alerts["4"].exists)
        XCTAssertTrue(app.alerts["5"].exists)
        XCTAssertTrue(app.alerts["6"].exists)
        XCTAssertTrue(app.alerts["7"].exists)
        XCTAssertTrue(app.alerts["8"].exists)
        XCTAssertTrue(app.alerts["9"].exists)
    }
    
    func checkEnterAddsNumbersToExpression() {
        let app = XCUIApplication()
        app.launch()
        
        let expected = ""
        
        app.buttons["0"].tap()
        
    }

}
