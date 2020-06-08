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
    
    var evaluation = Evaluation()
    var validate = validate()
    
    var expression: String = "" {
        didSet {
            expressionLabel.text = expression
        }
    }
    var numberEntry = ""
    var expressionStack = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expressionLabel.text = expression
        // Do any additional setup after loading the view.
    }
    
    @IBAction func zeroAction(_ sender: Any) {
        numberEntry += "0"
        expression += "0"
    }
    @IBAction func oneAction(_ sender: Any) {
        numberEntry += "1"
        expression += "1"
    }
    @IBAction func twoAction(_ sender: Any) {
        numberEntry += "2"
        expression += "2"
    }
    @IBAction func threeAction(_ sender: Any) {
        numberEntry += "3"
        expression += "3"
    }
    @IBAction func fourAction(_ sender: Any) {
        numberEntry += "4"
        expression += "4"
    }
    @IBAction func fiveAction(_ sender: Any) {
        numberEntry += "5"
        expression += "5"
    }
    @IBAction func sixAction(_ sender: Any) {
        numberEntry += "6"
        expression += "6"
    }
    @IBAction func sevenAction(_ sender: Any) {
        numberEntry += "7"
        expression += "7"
    }
    @IBAction func eightAction(_ sender: Any) {
        numberEntry += "8"
        expression += "8"
    }
    @IBAction func nineAction(_ sender: Any) {
        numberEntry += "9"
        expression += "9"
    }
    @IBAction func evalAction(_ sender: Any) {
        validate.self(expressionStack)
        evaluation = evaluation(equationStack: expressionStack)
        evaluation.evaluate()
    }
    @IBAction func clearAction(_ sender: Any) {
        expression = ""
        expressionStack = []
    }
    @IBAction func enterAction(_ sender: Any) {
        expressionStack.append(numberEntry)
        expression += " "
        numberEntry=""
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

