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
    let depopFee: Double
    let worthCutter: Double
    let shippingBuy: Double
    let itemBuy: Double?
    let predictedSell: Double
    let shippingPrice: Double
    
    init(shippingBuy: Double, itemBuy: Double, predictedSell: Double, shippingPrice: Double, depopFee: Double, worthCutter: Double) {
        self.shippingBuy = shippingBuy
        self.itemBuy = itemBuy
        self.predictedSell = predictedSell
        self.shippingPrice = shippingPrice
        self.depopFee = depopFee
        self.worthCutter = worthCutter
    }
    
    func calculateProfit() -> Double {
        let worth = worthCutter * predictedSell
        let totalCost = itemBuy! + shippingBuy
        var totalSell = worth + shippingPrice
        totalSell = (paypalPercentage * totalSell) - (depopFee * totalSell) - shippingPrice
        return totalSell - totalCost
    }
    
    func calculateMaxBid() -> String {
        let worth = worthCutter * predictedSell
        let totalSell = worth + shippingPrice
        let itemBuy = (paypalPercentage * totalSell) - (depopFee * totalSell) - shippingPrice - shippingBuy - 5
        return String(format: "%.2f", itemBuy)
    }
}
