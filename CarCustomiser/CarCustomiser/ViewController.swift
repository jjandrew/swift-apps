//
//  ViewController.swift
//  CarCustomiser
//
//  Created by JJ Andrew on 10/01/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var engineAndExhaustPackage: UISwitch!
    @IBOutlet var tiresPackage: UISwitch!
    @IBOutlet var brakesPackage: UISwitch!
    @IBOutlet var suspensionPackage: UISwitch!
    @IBOutlet var carStatistics: UILabel!
    @IBOutlet var remainingFundsDisplay: UILabel!
    @IBOutlet var remainingTimeDisplay: UILabel!
    @IBOutlet var timerDoneDisplay: UILabel!
    
    var timeRemaining = 30
    let maxFunds = 800
    var remainingFunds = 800 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
        }
    }
    var carNumber = 0
    
    var StarterCars = starterCars()
    
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = StarterCars.cars[0]
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        remainingTimeDisplay.text = "\(timeRemaining)"
        remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
    }

    @IBAction func finishSelectionButton(_ sender: Any) {
        remainingTimeDisplay.text = "0"
        timerDone()
    }
    
    
    @IBAction func nextCar(_ sender: Any) {
        if timeRemaining > 0 && remainingTimeDisplay.text != "0" {
            let length = StarterCars.cars.count
            carNumber += 1
            if carNumber >= length {
                carNumber = 0
            }
            car = StarterCars.cars[carNumber]
            engineAndExhaustPackage.isEnabled = true
            tiresPackage.isEnabled = true
            brakesPackage.isEnabled = true
            suspensionPackage.isEnabled = true
            engineAndExhaustPackage.setOn(false, animated: true)
            tiresPackage.setOn(false, animated: true)
            brakesPackage.setOn(false, animated: true)
            suspensionPackage.setOn(false, animated: true)
            remainingFunds = maxFunds
        }
    }

    func checkPrices() {
        if remainingFunds < 500 {
            engineAndExhaustPackage.isEnabled = false
            tiresPackage.isEnabled = false
            if remainingFunds < 250 {
                brakesPackage.isEnabled = false
                suspensionPackage.isEnabled = false
            } else {
                brakesPackage.isEnabled = true
                suspensionPackage.isEnabled = true
            }
        } else {
            engineAndExhaustPackage.isEnabled = true
            tiresPackage.isEnabled = true
            brakesPackage.isEnabled = true
            suspensionPackage.isEnabled = true
        }
        if engineAndExhaustPackage.isOn {
            engineAndExhaustPackage.isEnabled = true
        }
        if tiresPackage.isOn {
            tiresPackage.isEnabled = true
        }
        if brakesPackage.isOn {
            brakesPackage.isEnabled = true
        }
        if suspensionPackage.isOn {
            suspensionPackage.isEnabled = true
        }
    }
    
    @IBAction func engineAndExhaustToggle(_ sender: Any) {
        if engineAndExhaustPackage.isOn {
            car?.topSpeed += 5
            remainingFunds -= 500
        } else {
            car?.topSpeed -= 5
            remainingFunds += 500
        }
        checkPrices()
    }
    
    @IBAction func tiresPackageToggle(_ sender: Any) {
        if tiresPackage.isOn {
            car?.handling += 2
            remainingFunds -= 500
        } else {
            car?.handling -= 2
            remainingFunds += 500
        }
        checkPrices()
    }

    @IBAction func brakesPackageToggle(_ sender: Any) {
        if brakesPackage.isOn {
            car?.handling += 1
            remainingFunds -= 250
        } else {
            car?.handling -= 1
            remainingFunds += 250
        }
        checkPrices()
    }
    
    @IBAction func suspensionPackageToggle(_ sender: Any) {
        if suspensionPackage.isOn {
            car?.acceleration += 0.5
            let temp = String(format:"%.1f", car!.acceleration)
            car?.acceleration = Double(temp)!
            remainingFunds -= 250
        } else {
            car?.acceleration -= 0.5
            let temp = String(format:"%.1f", car!.acceleration)
            car?.acceleration = Double(temp)!
            remainingFunds += 250
        }
        checkPrices()
    }
    
    func timerDone() {
        timer?.invalidate()
        engineAndExhaustPackage.isEnabled = false
        tiresPackage.isEnabled = false
        brakesPackage.isEnabled = false
        suspensionPackage.isEnabled = false
        let alert = UIAlertController(title: "Timer Finished", message: """
        Car name: \(String(describing: car!.make))
        Model: \(String(describing: car!.model))
        Top Speed: \(String(describing: car!.topSpeed))
        Acceleration: \(String(describing: car!.acceleration))
        Handling: \(String(describing: car!.handling))
        Money Spent: \(800-remainingFunds)
        """, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
    
    @objc func countdown() {
        if timeRemaining > 0{
            timeRemaining -= 1
            remainingTimeDisplay.text = "\(timeRemaining)"
        } else {
            timerDone()
        }
    }
    
}
