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
    
    var tamagotchi: Tamagotchi? {
        didSet {
            tamagotchiStats.text = tamagotchi?.displayStats()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tamagotchi = starterTamagotchis.tamagotchis[0]
    }


}

