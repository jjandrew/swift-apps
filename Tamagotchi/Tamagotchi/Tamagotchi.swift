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
    var health = 5
    static let minHealth = 0
    static let maxHealth = 5
    var discipline = 50
    static let minDiscipline = 0
    static let maxDiscipline = 100
    
    func deathByAge() -> Bool {
        if age > Tamagotchi.lifespan {
            return true
        } else {
            return false
        }
    
    }
        
    func deathByHearts() -> Bool {
        if health <= Tamagotchi.minHealth {
            return true
        } else {
            return false
        }
    }
    
    func healthWithinRange() -> Int {
        if health > Tamagotchi.maxHealth {
            health = 5
        }
        return health
    }
    
    func disciplineWithinRange() -> Int {
        if discipline > Tamagotchi.maxDiscipline {
            discipline = 100
        }
        if discipline < Tamagotchi.minDiscipline {
            discipline = 0
        }
        return discipline
    }
    
    func birthday() -> Int {
        age += 1
        return age
    }
}
