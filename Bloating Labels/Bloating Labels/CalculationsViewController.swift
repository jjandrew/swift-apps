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
    var depopFee = 0.0
    var worthCutter = 0.0
    
    @IBOutlet var answerDisplay: UILabel!
    @IBOutlet var profitCalculator: UIButton!
    @IBOutlet var maxBidCalculator: UIButton!
    @IBOutlet var depopFeesSwitch: UISwitch!
    @IBOutlet var shippingCostSwitch: UISwitch!
    @IBOutlet var worthReductionSwitch: UISwitch!
    @IBOutlet var costentry: UITextField!
    @IBOutlet var shippingentry: UITextField!
    @IBOutlet var sellPrice: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerDisplay.text = ""
        costentry.text = "Enter Item Cost"
        shippingentry.text = "Enter shipping cost"
        sellPrice.text = "Enter potential sell price"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func itemCostText(_ sender: Any) {
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
        let profitPredictor = enterIntoProfitPredictor()
        let result = profitPredictor.calculateProfit()
        answerDisplay.text = String(format: "%.2f", result)
    }
    
    @IBAction func maxBidcalculatorButton(_ sender: Any) {
        let profitPredictor = enterIntoProfitPredictor()
        let result = profitPredictor.calculateMaxBid()
        answerDisplay.text = String(result)
    }
    
    @IBAction func depopFeesAction(_ sender: Any) {
    }
    
    @IBAction func shippingCostAction(_ sender: Any) {
    }
    
    @IBAction func worthReductionAction(_ sender: Any) {
    }
    
    func enterIntoProfitPredictor() -> ProfitPredictor {
        if depopFeesSwitch.isOn == true {
            depopFee = 0.1
        } else {
            depopFee = 0
        }
        if shippingCostSwitch.isOn == false {
            myShippingCost = 0.0
        }
        if worthReductionSwitch.isOn == true {
            worthCutter = 0.8
        } else {
            worthCutter = 1
        }
        itemCost = Double(costentry.text!)!
        sellerShippingCost = Double(shippingentry.text!)!
        potentialSell = Double(sellPrice.text!)!
        return ProfitPredictor(shippingBuy: myShippingCost, itemBuy: itemCost, predictedSell: potentialSell, shippingPrice: myShippingCost, depopFee: depopFee, worthCutter: worthCutter)
        
        
    }
    
    
}
