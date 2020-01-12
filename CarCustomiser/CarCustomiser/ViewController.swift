//
//  ViewController.swift
//  CarCustomiser
//
//  Created by JJ Andrew on 10/01/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var carStatistics: UILabel!
    
    var carNumber = 0
    
    var StarterCars = starterCars()
    
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = StarterCars.cars[carNumber]
    }

    @IBAction func nextCar(_ sender: Any) {
        let length = StarterCars.cars.count
        carNumber += 1
        if carNumber >= length {
            carNumber = 0
        }
        car = StarterCars.cars[carNumber]
    }


}

