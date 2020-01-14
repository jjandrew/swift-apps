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
