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
        let calculation = ProfitPredictor(shippingBuy: 5, itemBuy: 10, predictedSell: 37.5, shippingPrice: 2.8)
        let result = calculation.calculateMaxBid()
        XCTAssertEqual(result, "15.77")
    }


}
