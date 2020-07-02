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
    @IBOutlet var clearOutlet: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerDisplay.text = ""
        // Do any additional setup after loading the view.
    }
    
    func clear() {
        costentry.text = nil
        shippingentry.text = nil
        sellPrice.text = nil
        itemCost = 0.00
        sellerShippingCost = 0.00
        potentialSell = 0.00
        myShippingCost = 0.00
        depopFee = 0.0
        worthCutter = 0.0
        depopFeesSwitch.isOn = true
        shippingCostSwitch.isOn = true
        worthReductionSwitch.isOn = true
        answerDisplay.text = ""
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
        if costentry.text == nil {
            itemCost = 0
        } else {
            itemCost = Double(costentry.text!)!
        }
        if shippingentry.text == nil {
            sellerShippingCost = 0
        } else {
            sellerShippingCost = Double(shippingentry.text!)!
        }
        if sellPrice.text == nil {
            potentialSell = 0
        } else {
            potentialSell = Double(sellPrice.text!)!
        }
        return ProfitPredictor(shippingBuy: myShippingCost, itemBuy: itemCost, predictedSell: potentialSell, shippingPrice: myShippingCost, depopFee: depopFee, worthCutter: worthCutter)
        }
    
    @IBAction func clearAction(_ sender: Any) {
        clear()
    }
    
}
