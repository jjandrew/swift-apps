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
    var hunger = 5
    static let maxHunger = 10
    static let minHunger = 0
    var weight = 50
    static let maxWeight = 100
    static let minWeight = 10
    
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
    
    func hungerWithinRange() -> Int {
        if hunger > Tamagotchi.maxHunger {
            hunger = 10
        }
        if hunger < Tamagotchi.minHunger {
            hunger = 0
        }
        return hunger
    }
    
    func weightDeath() -> Bool {
        if weight > Tamagotchi.maxWeight {
            health = 0
            let dead = deathByHearts()
            return dead
        } else if weight < Tamagotchi.minWeight {
            health = 0
            let dead = deathByHearts()
            return dead
        } else {
            let dead = false
            return dead
        }
    }
    
    func death() {
        deathByHearts()
        deathByAge()
        weightDeath()
    }
    
    func eat() -> Int {
        hunger += 1
        hungerWithinRange()
        return hunger
    }
    
    func Discipline() -> Int {
        return discipline
    }
}
