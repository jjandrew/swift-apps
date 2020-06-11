//
//  Reverse_Polish_notationUITests.swift
//  Reverse Polish notationUITests
//
//  Created by JJ Andrew on 08/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import XCTest

class Reverse_Polish_notationUITests: XCTestCase {

    func testAllButtonsExist() {
        let app = XCUIApplication()
        app.launch()
        
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
        app.buttons["CLR"].tap()
        app.buttons["Enter"].tap()
        app.buttons["Eval"].tap()
        app.buttons["+"].tap()
        app.buttons["-"].tap()
        app.buttons["*"].tap()
        app.buttons["/"].tap()
        app.buttons["+/-"].tap()
        
    }
    
    func testEnterAddsNumbersToExpression() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["Enter"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "12 ").label, "12 ")
        
    }
    
    func testEvaluateWithAValidExpressionDisplaysCorrectAnswerToUser() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["3"].tap()
        app.buttons["Enter"].tap()
        app.buttons["4"].tap()
        app.buttons["*"].tap()
        app.buttons["Eval"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "12").label, "12")
        
    }
    
    func testWhenAppLaunchesEnterEquationIsDisplayed() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "Enter equation").label, "Enter equation")
    }
    
    func testWhenClearIsPressedEnterEquationIsDisplayed() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["3"].tap()
        app.buttons["Enter"].tap()
        app.buttons["4"].tap()
        app.buttons["Enter"].tap()
        app.buttons["CLR"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "Enter equation").label, "Enter equation")
    }
    
    func testNegateButtonNegatesNumberAndCanBeUndone() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["3"].tap()
        app.buttons["3"].tap()
        app.buttons["+/-"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "-33").label, "-33")
        
        app.buttons["+/-"].tap()
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "33").label, "33")
        
    }
    
    func testNegateButtonWithNoNumberEnteredNegatesNumberAnCanBeUndone() {
        
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["+/-"]
        button.tap()
        button.tap()
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "Enter equation").label , "Enter equation")
        
    }
    
    func testMinusButtonWorks() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["9"].tap()
        app.buttons["9"].tap()
        app.buttons["Enter"].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["Eval"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "96").label, "96")
    }
    
    func testMultiplyButtonWorks() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["9"].tap()
        app.buttons["Enter"].tap()
        app.buttons["3"].tap()
        app.buttons["*"].tap()
        app.buttons["Eval"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "27").label, "27")
    }
    
    func testPlusButtonWorks() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["4"].tap()
        app.buttons["0"].tap()
        app.buttons["Enter"].tap()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        app.buttons["Eval"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "42").label, "42")
    }

    func testDivideButtonWorks() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["9"].tap()
        app.buttons["9"].tap()
        app.buttons["Enter"].tap()
        app.buttons["3"].tap()
        app.buttons["/"].tap()
        app.buttons["Eval"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "33").label, "33")
    }
    
    func testAlertButtonWorks() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["9"].tap()
        app.buttons["9"].tap()
        app.buttons["9"].tap()
        app.buttons["9"].tap()
        app.buttons["Enter"].tap()
        app.buttons["Ok"].tap()
        
    }
    
    func testIfMultipleOperatorsAreEnteredSystemFails() {
        
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["+"]
        button.tap()
        button.tap()
        button.tap()
        app.buttons["Eval"].tap()
        app.alerts["Error"].scrollViews.otherElements.buttons["Ok"].tap()
        
    }
    
    func testPlusButtonDisplaysErrorForAboveAndBelowRange() {
        
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["8"]
        button.tap()
        button.tap()
        button.tap()
        button.tap()
        app.buttons["+"].tap()
        
        let okButton = app.alerts["Error"].scrollViews.otherElements.buttons["Ok"]
        okButton.tap()
        app.buttons["CLR"].tap()
        
        let button2 = app.buttons["9"]
        button2.tap()
        button2.tap()
        button2.tap()
        button2.tap()
        app.buttons["+/-"].tap()
        app.buttons["+"].tap()
        okButton.tap()
        
    }
    
    func testMinusButtonDisplaysErrorForAboveAndBelowRange() {
        
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["8"]
        button.tap()
        button.tap()
        button.tap()
        button.tap()
        app.buttons["-"].tap()
        
        let okButton = app.alerts["Error"].scrollViews.otherElements.buttons["Ok"]
        okButton.tap()
        app.buttons["CLR"].tap()
        
        let button2 = app.buttons["9"]
        button2.tap()
        button2.tap()
        button2.tap()
        button2.tap()
        app.buttons["+/-"].tap()
        app.buttons["-"].tap()
        okButton.tap()
        
    }
    
    func testTimesButtonDisplaysErrorForAboveAndBelowRange() {
        
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["8"]
        button.tap()
        button.tap()
        button.tap()
        button.tap()
        app.buttons["*"].tap()
        
        let okButton = app.alerts["Error"].scrollViews.otherElements.buttons["Ok"]
        okButton.tap()
        app.buttons["CLR"].tap()
        
        let button2 = app.buttons["9"]
        button2.tap()
        button2.tap()
        button2.tap()
        button2.tap()
        app.buttons["+/-"].tap()
        app.buttons["*"].tap()
        okButton.tap()
        
    }
    
    func testDivideButtonDisplaysErrorForAboveAndBelowRange() {
        
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["8"]
        button.tap()
        button.tap()
        button.tap()
        button.tap()
        app.buttons["/"].tap()
        
        let okButton = app.alerts["Error"].scrollViews.otherElements.buttons["Ok"]
        okButton.tap()
        app.buttons["CLR"].tap()
        
        let button2 = app.buttons["9"]
        button2.tap()
        button2.tap()
        button2.tap()
        button2.tap()
        app.buttons["+/-"].tap()
        app.buttons["/"].tap()
        okButton.tap()
        
    }
    
}
