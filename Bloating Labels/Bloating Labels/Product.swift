//
//  Product.swift
//  Bloating Labels
//
//  Created by JJ Andrew on 23/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class Product {
    var name: String
    var brand: String
    var colour: String
    var cost: Double
    var predictedPrice: Double
    
    init(name: String, brand: String, colour: String, cost: Double, predictedPrice: Double){
        self.name = name
        self.brand = brand
        self.colour = colour
        self.cost = cost
        self.predictedPrice = predictedPrice
    }
}
