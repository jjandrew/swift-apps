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
    @IBOutlet var pooIcon: UIButton!
    
    var starterTamagotchis = StarterTamagotchis()
    var age = 0
    var ageCounter = 0
    var timer: Timer?
    var timeDone = 0
    
    var tamagotchi: Tamagotchi? {
        didSet {
            tamagotchiStats.text = tamagotchi?.displayStats()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pooIcon.isHidden = true
        // Do any additional setup after loading the view.
        tamagotchi = starterTamagotchis.tamagotchis[Int.random(in: 0...1)]
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    @objc func countdown() {
        timeDone += 1
        poo()
    }
    
    func poo() {
        if tamagotchi!.discipline < 3 {
            if timeDone%4 == 0 {
                pooIcon.isHidden = false
            }
        } else if tamagotchi!.discipline < 7 {
            if timeDone%6 == 0 {
                pooIcon.isHidden = false
            }
        } else if tamagotchi!.discipline < 10 {
            if timeDone%8 == 0 {
                pooIcon.isHidden = false
            }
        }
    }
    
    func happinessWithinRange() {
        if tamagotchi!.happiness > Tamagotchi.maxHappiness {
            tamagotchi?.happiness = 10
        }
        if tamagotchi!.happiness < Tamagotchi.minHappiness {
            tamagotchi?.happiness = 0
        }
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
            tamagotchi?.discipline = 10
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
        let random = Int.random(in: 0...10)
        if tamagotchi!.discipline == Tamagotchi.maxDiscipline {
            if random  == 1 {
                return true
            } else {
                return false
            }
        } else if tamagotchi!.discipline == Tamagotchi.minDiscipline {
            if random == 1 {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func happinessDeath() -> Bool {
        if tamagotchi!.happiness == Tamagotchi.minHappiness {
            return true
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
            if tamagotchi!.weight == Tamagotchi.maxWeight {
                let alert = UIAlertController(title: "Your Tamagotchi Has Died", message: "Your tamagotchi got too fat and exploded", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Your Tamagotchi Has Died", message: "Your tamagotchi got too thin and imploded", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        } else if reason == "discipline" {
            if tamagotchi!.discipline == Tamagotchi.maxDiscipline {
                let alert = UIAlertController(title: "Your Tamagotchi Has Died", message: "You disciplined your tamagotchi too much that you hurt him", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Your Tamagotchi Has Died", message: "Your Tamagotchi had no discipline and joined the circus", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        } else if reason == "happiness" {
            let alert = UIAlertController(title: "Your Tamagotchi Has Died", message: "Your Tamagotchi got so sad he died", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func hasDied() {
        let heartDeath = deathByHearts()
        let ageDeath = deathByAge()
        let deathWeight = weightDeath()
        let DisciplineDeath = disciplineDeath()
        let HappinessDeath = happinessDeath()
        if heartDeath == true {
            deathAlert(reason: "hearts")
        } else if ageDeath == true {
            deathAlert(reason: "age")
        } else if deathWeight == true {
            deathAlert(reason: "weight")
        } else if DisciplineDeath == true {
            deathAlert(reason: "discipline")
        } else if HappinessDeath == true {
            deathAlert(reason: "happiness")
        }
    }
    
    func birthday() {
        if ageCounter == 2 {
            tamagotchi?.age += 1
            ageCounter = 0
        }
    }
    
    @IBAction func feedMealButton(_ sender: Any) {
        tamagotchi?.hunger -= 2
        hungerWithinRange()
        tamagotchi?.weight += 20
        weightWithinRange()
        hasDied()
        ageCounter += 1
        birthday()
    }
    @IBAction func feedSnackButton(_ sender: Any) {
        tamagotchi?.hunger -= 1
        hungerWithinRange()
        tamagotchi?.weight += 10
        weightWithinRange()
        hasDied()
        ageCounter += 1
        birthday()
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
        tamagotchi?.happiness += 2
        happinessWithinRange()
        hasDied()
        ageCounter += 1
        birthday()
    }
    @IBAction func disiplineButton(_ sender: Any) {
        tamagotchi?.discipline += 3
        disciplineWithinRange()
        tamagotchi?.happiness -= 3
        happinessWithinRange()
        hasDied()
        ageCounter += 1
        birthday()
    }
    
    @IBAction func pooButton(_ sender: Any) {
        pooIcon.isHidden = true
    }
    
}

