//
//  ViewController.swift
//  Reverse Polish notation
//
//  Created by JJ Andrew on 08/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var expressionLabel: UILabel!
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var sevenButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!
    @IBOutlet var evaluateButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var enterButton: UIButton!
    @IBOutlet var negateButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var divideButton: UIButton!
    
    var expression = ""
    var numberEntry = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expressionLabel.text = expression
        // Do any additional setup after loading the view.
    }
    
    @IBAction func zeroAction(_ sender: Any) {
        numberEntry + "0"
    }
    @IBAction func oneAction(_ sender: Any) {
        numberEntry + "1"
    }
    @IBAction func twoAction(_ sender: Any) {
        numberEntry + "2"
    }
    @IBAction func threeAction(_ sender: Any) {
        numberEntry + "3"
    }
    @IBAction func fourAction(_ sender: Any) {
        numberEntry + "4"
    }
    @IBAction func fiveAction(_ sender: Any) {
        numberEntry + "5"
    }
    @IBAction func sixAction(_ sender: Any) {
        numberEntry + "6"
    }
    @IBAction func sevenAction(_ sender: Any) {
        numberEntry + "7"
    }
    @IBAction func eightAction(_ sender: Any) {
        numberEntry + "8"
    }
    @IBAction func nineAction(_ sender: Any) {
        numberEntry + "9"
    }
    @IBAction func evalAction(_ sender: Any) {
    }
    @IBAction func clearAction(_ sender: Any) {
    }
    @IBAction func enterAction(_ sender: Any) {
    }
    @IBAction func negateAction(_ sender: Any) {
    }
    @IBAction func plusAction(_ sender: Any) {
    }
    @IBAction func minusAction(_ sender: Any) {
    }
    @IBAction func multiplyAction(_ sender: Any) {
    }
    @IBAction func divideAction(_ sender: Any) {
    }
}

