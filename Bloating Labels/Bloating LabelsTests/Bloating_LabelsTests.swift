//
//  Bloating_LabelsTests.swift
//  Bloating LabelsTests
//
//  Created by JJ Andrew on 23/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import XCTest
@testable import Bloating_Labels

class Bloating_LabelsTests: XCTestCase {


    func testMaxBid() {
        let calculation = ProfitPredictor(shippingBuy: 5, itemBuy: 10, predictedSell: 37.5, shippingPrice: 2.8, depopFee: 0.1, worthCutter: 0.8)
        let result = calculation.calculateMaxBid()
        XCTAssertEqual(result, "15.77")
    }
    
    func testMaxBid2() {
        let calculation = ProfitPredictor(shippingBuy: 4.1, itemBuy: 16, predictedSell: 47.5, shippingPrice: 2.8, depopFee: 0.1, worthCutter: 0.8)
        let result = calculation.calculateMaxBid()
        XCTAssertEqual(result, "15.77")
    }


}
