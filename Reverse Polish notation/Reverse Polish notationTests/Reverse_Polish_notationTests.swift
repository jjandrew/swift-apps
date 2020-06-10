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
    
}
