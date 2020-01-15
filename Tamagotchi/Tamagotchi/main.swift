//
//  main.swift
//  Tamagotchi
//
//  Created by Andrew, James (NA) on 19/11/2019.
//  Copyright © 2019 Andrew, James (NA). All rights reserved.
//

import Foundation

let tamagotchi = Tamagotchi()

func main() {
    var end = 0
    repeat {
        print("Health:", tamagotchi.health)
        print("Discipline:", tamagotchi.discipline)
        print("Weight:", tamagotchi.weight)
        print("Age:", tamagotchi.age)
        print("Hunger:", tamagotchi.hunger)
        end = 1
    } while end == 0
    
}

