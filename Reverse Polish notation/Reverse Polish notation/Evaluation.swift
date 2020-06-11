//
//  Evaluation.swift
//  Reverse Polish notation
//
//  Created by JJ Andrew on 08/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class Evaluation {
    var equationArray: [String]
    var equationStack: [String]
    
    init(equationArray: [String]){
        self.equationArray = equationArray
        self.equationStack = []
    }
    
    func evaluate() -> String {
        var result = 0
        for i in (0 ..< equationArray.count) {
            let currentPart = equationArray[i]
            if let currentPart = Int(currentPart) {
                equationStack.append(String(currentPart))
            } else if equationStack.count == 1 {
                print("error must have more than one operand")
            } else if correctOperator(part: currentPart) == true {
                let operand2 = Int(equationStack[equationStack.count - 1])!
                equationStack.remove(at: equationStack.count - 1)
                let operand1 = Int(equationStack[equationStack.count - 1])!
                equationStack.remove(at: equationStack.count - 1)
                if currentPart == "+" {
                    result = operand1 + operand2
                } else if currentPart == "-" {
                    result = operand1 - operand2
                } else if currentPart == "*" {
                    result = operand1 * operand2
                } else {
                    result = operand1 / operand2
                }
                equationStack.append(String(result))
            } else {
                print("Error, unknown symbol in expression")
            }
        }
        return equationStack[equationStack.count - 1]

    }
            
    func correctOperator(part: String) -> Bool {
        if part == "+" {
            return true
        } else if part == "-" {
            return true
        } else if part == "*" {
            return true
        } else if part == "/" {
            return true
        } else {
            return false
        }
    }
}
