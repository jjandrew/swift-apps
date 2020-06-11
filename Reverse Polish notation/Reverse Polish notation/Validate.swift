//
//  Validate.swift
//  Reverse Polish notation
//
//  Created by JJ Andrew on 08/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class Validate {
    let expressionArray: [String]
    var reason = ""
    
    init(expressionArray: [String]) {
        self.expressionArray = expressionArray
    }
    
    func validate() {
        var validated = true
        print(expressionArray)
        print(expressionArray.count)
        if expressionArray.count < 3 {
            self.reason = "Expression must have at least 3 items"
            validated = false
        } else if correctOperator(part: expressionArray[expressionArray.count - 1]) == false {
            self.reason = "Expression must end in an operator"
            validated = false
        } else {
            for i in (2 ..< expressionArray.count - 1) {
                if let checkInteger = Int(expressionArray[i]) {
                    if let checkInteger = Int(expressionArray[i-1]) {
                        if let checkInteger = Int(expressionArray[i-2]) {
                            self.reason = "Cannot have 3 integers in a row"
                            validated = false
                        }
                    }
                }
            }
        }
        if validated == true {
            self.reason = "true"
        }
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

