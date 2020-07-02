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
    var itemsToList: [Product]
    var postedItems: [Product]
    
    init(soldItems: [Product], itemsToList: [Product], postedItems: [Product]) {
        self.soldItems = soldItems
        self.itemsToList = itemsToList
        self.postedItems = postedItems
        calculateProfit()
    }
    
    func calculateProfit() {
    }
}
