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
    
    
    var expression: String = "" {
        didSet {
            expressionLabel.text = expression
        }
    }
    var tempExpression: String = "" {
        didSet {
            expressionLabel.text = tempExpression
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
        tempExpression += "0"
    }
    @IBAction func oneAction(_ sender: Any) {
        numberEntry += "1"
        tempExpression += "1"
    }
    @IBAction func twoAction(_ sender: Any) {
        numberEntry += "2"
        tempExpression += "2"
    }
    @IBAction func threeAction(_ sender: Any) {
        numberEntry += "3"
        tempExpression += "3"
    }
    @IBAction func fourAction(_ sender: Any) {
        numberEntry += "4"
        tempExpression += "4"
    }
    @IBAction func fiveAction(_ sender: Any) {
        numberEntry += "5"
        tempExpression += "5"
    }
    @IBAction func sixAction(_ sender: Any) {
        numberEntry += "6"
        tempExpression += "6"
    }
    @IBAction func sevenAction(_ sender: Any) {
        numberEntry += "7"
        tempExpression += "7"
    }
    @IBAction func eightAction(_ sender: Any) {
        numberEntry += "8"
        tempExpression += "8"
    }
    @IBAction func nineAction(_ sender: Any) {
        numberEntry += "9"
        tempExpression += "9"
    }
    @IBAction func evalAction(_ sender: Any) {
        let validation = Validate(expressionStack: expressionStack)
        validation.validate()
        if validation.reason == "true" {
            let evaluation = Evaluation(equationStack: expressionStack)
            evaluation.evaluate()
        } else {
            let alert = UIAlertController(title: "Error", message: validation.reason, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            expression = ""
            expressionStack = []
        }
    }
    @IBAction func clearAction(_ sender: Any) {
        expression = ""
        tempExpression = expression
        numberEntry = expression
        expressionStack = []
    }
    @IBAction func enterAction(_ sender: Any) {
        if numberEntry == "" {
            let alert = UIAlertController(title: "Error", message: "Must enter a number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            if let intNumberEntry = Int(numberEntry) {
                if intNumberEntry > 999 {
                    let alert = UIAlertController(title: "Error", message: "Number must be less than 999", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    tempExpression = expression
                } else if intNumberEntry < -999 {
                    let alert = UIAlertController(title: "Error", message: "Number must be more than -999", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    tempExpression = expression
                }
            }
            expressionStack.append(numberEntry)
            expression = tempExpression
            expression += " "
            tempExpression = expression
            numberEntry = ""
        }
    }
    
    @IBAction func negateAction(_ sender: Any) {
        if numberEntry.count == 0 {
            print("Option 3")
            numberEntry += "-"
            tempExpression += numberEntry
        } else {
            //need to index here
            var numberEntryArray = Array(numberEntry)
            if numberEntryArray[0] == "-" {
                print("option 1")
                numberEntryArray.remove(at:0)
                print(numberEntryArray)
                numberEntry = String(numberEntryArray)
                tempExpression = expression + numberEntry
            } else {
                print("Option 2")
                numberEntry = "-" + numberEntry
                tempExpression = expression + numberEntry
            }
        }
        print("Number entry")
        print(numberEntry)
        print("tempExpression")
        print(tempExpression)
        print("Expression")
        print(expression)
    }
    
    @IBAction func plusAction(_ sender: Any) {
        numberEntry += "+"
        tempExpression += "+"
    }
    @IBAction func minusAction(_ sender: Any) {
        numberEntry += "-"
        tempExpression += "-"
    }
    @IBAction func multiplyAction(_ sender: Any) {
        numberEntry += "*"
        tempExpression += "*"
    }
    @IBAction func divideAction(_ sender: Any) {
        numberEntry += "/"
        tempExpression += "/"
    }
}

