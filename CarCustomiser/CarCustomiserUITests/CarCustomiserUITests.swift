//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by JJ Andrew on 10/01/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import XCTest

class CarCustomiserUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDisplayStatsAreLoaded() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "carStats").label, """
        Make: Mazda
        Model: MX-5
        Top Speed: 125mph
        Acceleration (0-60 in): 7.7s
        Handling: 5
        """)
    }

    func testWhenBoughtEngineAndTBrakesPackagesTiresPackageIsDisabled() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        //act
        app.switches["engineSwitch"].tap()
        app.switches["brakesSwitch"].tap()
        
        //assert
        XCTAssertEqual(app.switches["tiresSwitch"].isEnabled, false)
        XCTAssertEqual(app.switches["suspensionSwitch"].isEnabled, false)
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testWhenNextCarButtonPressedUpgradesAreReset() {
        let app = XCUIApplication()
        app.launch()
        
        app.switches["engineSwitch"].tap()
        app.switches["brakesSwitch"].tap()
        app.buttons["nextCarButton"].tap()
        
        XCTAssertEqual(app.switches["tiresSwitch"].isSelected, false)
        XCTAssertEqual(app.switches["suspensionSwitch"].isSelected, false)

    }
    
    func testRemainingFundsIsUpdated() {
        let app = XCUIApplication()
        app.launch()
        
        app.switches["engineSwitch"].tap()
        app.switches["brakesSwitch"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "remainingFundsLabel").label, "Remaining Funds: 50")
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
