//
//  CalculationsViewController.swift
//  Bloating Labels
//
//  Created by JJ Andrew on 24/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class CalculationsViewController: UIViewController {

    var itemCost: Double = 0.00
    var sellerShippingCost: Double = 0.00
    var potentialSell: Double = 0.00
    var myShippingCost: Double = 0.00
    
    @IBOutlet var profitCalculator: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func itemCostText(_ sender: Any) {
        let tempText = itemCostText.text
    }
    
    @IBAction func shippingCost(_ sender: Any) {
    }
    
    @IBAction func potentialSell(_ sender: Any) {
    }
    
    @IBAction func smallPackage(_ sender: Any) {
        myShippingCost = 2.80
    }
    
    @IBAction func mediumPackage(_ sender: Any) {
        myShippingCost = 3.75
    }
    
    @IBAction func largePackage(_ sender: Any) {
        myShippingCost = 5.30
    }
    
    
    @IBAction func profitCalculatorButton(_ sender: Any) {
        
    }
    


}
