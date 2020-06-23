//
//  Profile.swift
//  Bloating Labels
//
//  Created by JJ Andrew on 23/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class Profile {
    var soldItems: [Product]
    var currentItems: [Product]
    var costs: Double
    var income: Double
    var profit: Double
    
    init(soldItems: [Product], currentItems: [Product], costs: Double, income: Double) {
        self.soldItems = soldItems
        self.currentItems = currentItems
        self.costs = costs
        self.income = income
        self.profit = 0.00
        calculateProfit()
    }
    
    func calculateProfit() {
        self.profit = self.income - self.costs
    }
}
