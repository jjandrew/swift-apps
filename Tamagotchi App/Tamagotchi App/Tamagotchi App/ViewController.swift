//
//  ViewController.swift
//  Tamagotchi App
//
//  Created by Andrew, James (NA) on 14/01/2020.
//  Copyright © 2020 Andrew, James (NA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tamagotchiStats: UILabel!
    
    var starterTamagotchis = StarterTamagotchis()
    var age = 0
    
    var tamagotchi: Tamagotchi? {
        didSet {
            tamagotchiStats.text = tamagotchi?.displayStats()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tamagotchi = starterTamagotchis.tamagotchis[Int.random(in: 0...1)]
    }

    func hungerWithinRange() {
        if tamagotchi!.hunger > Tamagotchi.maxHunger {
            tamagotchi?.hunger = 10
        }
        if tamagotchi!.hunger < Tamagotchi.minHunger {
            tamagotchi?.hunger = 0
        }
    }
    
    func healthWithinRange() {
        if tamagotchi!.health > Tamagotchi.maxHealth {
            tamagotchi?.health = 5
        }
    }
    
    func disciplineWithinRange() {
        if tamagotchi!.discipline > Tamagotchi.maxDiscipline {
            tamagotchi?.discipline = 100
        }
        if tamagotchi!.discipline < Tamagotchi.minDiscipline {
            tamagotchi?.discipline = 0
        }
    }
    
    func weightWithinRange() {
        if tamagotchi!.weight > Tamagotchi.maxWeight {
            tamagotchi?.weight = 100
        }
        if tamagotchi!.weight < Tamagotchi.minWeight {
            tamagotchi?.weight = 0
        }
    }
    
    func deathByAge() -> Bool {
        if tamagotchi!.age == Tamagotchi.lifespan {
            return true
        } else {
            return false
        }
    
    }
        
    func deathByHearts() -> Bool {
        if tamagotchi!.health == Tamagotchi.minHealth {
            return true
        } else {
            return false
        }
    }
    
    func weightDeath() -> Bool {
        if tamagotchi!.weight == Tamagotchi.maxWeight {
            return true
        } else if tamagotchi!.weight == Tamagotchi.minWeight {
            return true
        } else {
            return false
        }
    }
    
    func disciplineDeath() -> Bool {
        let random = Int.random(in: 0...1)
        if tamagotchi!.discipline == Tamagotchi.maxDiscipline {
            if random  == 1 {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func deathAlert(reason: String) {
        if reason == "hearts" {
            let alert = UIAlertController(title: "Your Tamagotchi Has Died", message: "You ran out of hearts", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        
        } else if reason == "age" {
            let alert = UIAlertController(title: "Your Tamagotchi Has Died", message: "Well done it died of old age!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        
        } else if reason == "weight" {
            let alert = UIAlertController(title: "Your Tamagotchi Has Died", message: "Your tamagotchi got too fat and exploded", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        
        } else if reason == "discipline" {
            let alert = UIAlertController(title: "Your Tamagotchi Has Died", message: "You disciplined your tamagotchi so much that you broke its neck", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func hasDied() {
        let heartDeath = deathByHearts()
        let ageDeath = deathByAge()
        let deathWeight = weightDeath()
        let DisciplineDeath = disciplineDeath()
        if heartDeath == true {
            deathAlert(reason: "hearts")
        } else if ageDeath == true {
            deathAlert(reason: "age")
        } else if deathWeight == true {
            deathAlert(reason: "weight")
        } else if DisciplineDeath == true {
            deathAlert(reason: "discipline")
        }
    }
    
    func birthday() {
        tamagotchi?.age += 1
    }
    
    @IBAction func feedMealButton(_ sender: Any) {
        tamagotchi?.hunger -= 2
        hungerWithinRange()
        tamagotchi?.weight += 20
        weightWithinRange()
        hasDied()
    }
    @IBAction func feedSnackButton(_ sender: Any) {
        tamagotchi?.hunger -= 1
        hungerWithinRange()
        tamagotchi?.weight += 10
        weightWithinRange()
        hasDied()
    }
    @IBAction func playGameButton(_ sender: Any) {
        tamagotchi?.discipline -= 3
        disciplineWithinRange()
        tamagotchi?.health += 1
        healthWithinRange()
        tamagotchi?.weight -= 10
        weightWithinRange()
        tamagotchi?.hunger += 2
        hungerWithinRange()
    }
    @IBAction func disiplineButton(_ sender: Any) {
        disciplineWithinRange()
    }
    
}

