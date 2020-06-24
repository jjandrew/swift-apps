//
//  ProfitPredictor.swift
//  Bloating Labels
//
//  Created by JJ Andrew on 24/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class ProfitPredictor {
    let paypalPercentage: Double = 0.971
    let paypalConstant: Double = 0.2
    let depopFee: Double = 0.10
    let shippingBuy: Double
    let itemBuy: Double
    let predictedSell: Double
    let shippingPrice: Double
    
    init(shippingBuy: Double, itemBuy: Double, predictedSell: Double, shippingPrice: Double) {
        self.shippingBuy = shippingBuy
        self.itemBuy = itemBuy
        self.predictedSell = predictedSell
        self.shippingPrice = shippingPrice
    }
}
