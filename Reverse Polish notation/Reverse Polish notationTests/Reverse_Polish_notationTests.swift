//
//  Reverse_Polish_notationTests.swift
//  Reverse Polish notationTests
//
//  Created by JJ Andrew on 08/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import XCTest
@testable import Reverse_Polish_notation

class Reverse_Polish_notationTests: XCTestCase {

    func testPositiveEvaluationWithAPlusReturnsCorrectAnswer() {
        let evaluation = Evaluation(equationArray: ["7", "9", "+"])
        let result = evaluation.evaluate()
        let expected = "16"
        XCTAssertEqual(result, expected)
    }
    
    func testNegativeEvaluationWithAPlusReturnsCorrectAnswer() {
        let evaluation = Evaluation(equationArray: ["-73", "-20", "+"])
        let result = evaluation.evaluate()
        let expected = "-93"
        XCTAssertEqual(result, expected)
    }
    
    func testPositiveEvaluationWithAMinuesReturnsCorrectAnswer() {
        let evaluation = Evaluation(equationArray: ["56", "90", "-"])
        let result = evaluation.evaluate()
        let expected = "-34"
        XCTAssertEqual(result, expected)
    }
    
    func testNegativeEvaluationWithAMinuesReturnsCorrectAnswer() {
        let evaluation = Evaluation(equationArray: ["-56", "-90", "-"])
        let result = evaluation.evaluate()
        let expected = "34"
        XCTAssertEqual(result, expected)
    }

    func testPositiveEvaluationWithAMultiplyReturnsCorrectAnswer() {
        let evaluation = Evaluation(equationArray: ["200", "6", "*"])
        let result = evaluation.evaluate()
        let expected = "1200"
        XCTAssertEqual(result, expected)
    }
    
    func testNegativeEvaluationWithAMultiplyReturnsCorrectAnswer() {
        let evaluation = Evaluation(equationArray: ["-200", "-6", "*"])
        let result = evaluation.evaluate()
        let expected = "1200"
        XCTAssertEqual(result, expected)
    }
    
    func testPositiveEvaluationWithADivideReturnsCorrectAnswer() {
        let evaluation = Evaluation(equationArray: ["3", "2", "/"])
        let result = evaluation.evaluate()
        let expected = "1"
        XCTAssertEqual(result, expected)
    }
    
    func testNegativeEvaluationWithADivideReturnsCorrectAnswer() {
        let evaluation = Evaluation(equationArray: ["-12", "-2", "/"])
        let result = evaluation.evaluate()
        let expected = "6"
        XCTAssertEqual(result, expected)
    }
    
    func testEvaluationWithMultipleOperatorsReturnsCorrectAnswer() {
        let evaluation = Evaluation(equationArray: ["-12", "2", "/", "5", "100", "+", "*"])
        let result = evaluation.evaluate()
        let expected = "-630"
        XCTAssertEqual(result, expected)
    }
    
    func testValidateWillReturnErrorIfNothingIsEntered() {
        let validate = Validate(expressionArray: [])
        validate.validate()
        let result = validate.reason
        let expected = "Expression must have at least 3 items"
        XCTAssertEqual(result, expected)
    }
    
    func testValidateWillReturnErrorIfOneDigitIsEntered() {
        let validate = Validate(expressionArray: ["1"])
        validate.validate()
        let result = validate.reason
        let expected = "Expression must have at least 3 items"
        XCTAssertEqual(result, expected)
    }
    
    func testValidateWillReturnErrorIfTwoDigitsAreEntered() {
        let validate = Validate(expressionArray: ["1","2"])
        validate.validate()
        let result = validate.reason
        let expected = "Expression must have at least 3 items"
        XCTAssertEqual(result, expected)
    }
    
    func testValidateWillReturnErrorIfEquationEndingInOperatorIsEntered() {
        let validate = Validate(expressionArray: ["4", "5", "+", "6"])
        validate.validate()
        let result = validate.reason
        let expected = "Expression must end in an operator"
        XCTAssertEqual(result, expected)
    }
    
    func testValidateWillReturnErrorIfThreeIntegersInARowAreEntered() {
        let validate = Validate(expressionArray: ["4", "5", "+", "6", "9", "10", "-"])
        validate.validate()
        let result = validate.reason
        let expected = "Cannot have 3 integers in a row"
        XCTAssertEqual(result, expected)
    }
    
    func testValidateWillReturnTrueIfShortValidExpressionIsEntered() {
        let validate = Validate(expressionArray: ["4", "5", "+"])
        validate.validate()
        let result = validate.reason
        let expected = "true"
        XCTAssertEqual(result, expected)
    }
    
    func testValidateWillReturnTrueIfLongValidExpressionIsEntered() {
        let validate = Validate(expressionArray: ["-12", "2", "/", "5", "100", "+", "*"])
        validate.validate()
        let result = validate.reason
        let expected = "true"
        XCTAssertEqual(result, expected)
    }
    
}
