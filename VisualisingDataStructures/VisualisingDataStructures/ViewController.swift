//
//  ViewController.swift
//  VisualisingDataStructures
//
//  Created by Andrew, James (NA) on 28/01/2020.
//  Copyright © 2020 Andrew, James (NA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //label 0 = top label
    
    @IBOutlet var stackPush: UIButton!
    @IBOutlet var label0: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!
    @IBOutlet var label7: UILabel!
    @IBOutlet var label8: UILabel!
    @IBOutlet var label9: UILabel!
    
    
    
    
    var stack = Stack(maxSize: 10, top: -1, array: ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackMain()
        // Do any additional setup after loading the view.
    }
    
    func stackMain() {
        var stackArray = [String]()
        for _ in (0...9) {
          stackArray.append("_")
        }
        var stack = Stack(maxSize: 10, top: -1, array: stackArray)
        
        
        var stop = false
        while stop == false {
          print("What would you like to do, input 1 to push, 2 to pop, 3 to peek or anything else to quit")
          let choice = readLine()
          if choice == "1" {
            print("Enter a character to push")
            if let item = readLine() {
              stack.push(item: item)
            }
          } else if choice == "2" {
            let value = stack.pop()
            if value == "Stack is empty" {
              print(" ")
            } else {
              print("Item is ", value)
            }
          } else if choice == "3" {
            let value = stack.peek()
            if stack.top > -1 {
              print("Value on top is", value)
            } else {
              print(value)
            }
          } else {
            stop = true
          }
          print(" ")
          for i in stride(from: stack.top, to: -1, by: -1) {
            print(stack.array[i])
          }
        }
    }
    
    @IBAction func stackPushButton(_ sender: Any) {
        let intItem = Int.random(in: 0...100)
        let item = String(intItem)
        stack.push(item: item)
        print(stack.array)
    }

    
}

