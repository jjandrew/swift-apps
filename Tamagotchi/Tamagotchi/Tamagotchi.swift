//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Andrew, James (NA) on 22/11/2019.
//  Copyright © 2019 Andrew, James (NA). All rights reserved.
//

import Foundation

class Tamagotchi {
    static let lifespan = 26
    var age = 0
    
    func checkDead() -> Bool {
        if age > Tamagotchi.lifespan {
            return true
        } else {
            return false
        }
    }
}
