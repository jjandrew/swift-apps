//
//  Tamagotchi.swift
//  Tamagotchi App
//
//  Created by Andrew, James (NA) on 14/01/2020.
//  Copyright © 2020 Andrew, James (NA). All rights reserved.
//

import Foundation

struct Tamagotchi {
    var name: String
    var age: Int
    var health: Int
    var discipline: Int
    var weight: Int
    var hunger: Int
    static let lifespan = 26
    static let minHealth = 0
    static let maxHealth = 5
    static let minDiscipline = 0
    static let maxDiscipline = 10
    static let maxHunger = 10
    static let minHunger = 0
    static let maxWeight = 100
    static let minWeight = 10
    
    func displayStats() -> String {
        return """
        Name: \(name)
        Age: \(age)
        Health: \(health)
        Discipline \(discipline)
        Weight: \(weight)
        Hunger: \(hunger)
        """
        
    }
}
