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
    
    var expression = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expressionLabel.text = expression
        // Do any additional setup after loading the view.
    }
    
    @IBAction func zeroAction(_ sender: Any) {
    }
    @IBAction func oneAction(_ sender: Any) {
    }
    @IBAction func twoAction(_ sender: Any) {
    }
    @IBAction func threeAction(_ sender: Any) {
    }
    @IBAction func fourAction(_ sender: Any) {
    }
    @IBAction func fiveAction(_ sender: Any) {
    }
    @IBAction func sixAction(_ sender: Any) {
    }
    @IBAction func sevenAction(_ sender: Any) {
    }
    @IBAction func eightAction(_ sender: Any) {
    }
    @IBAction func nineAction(_ sender: Any) {
    }
}

