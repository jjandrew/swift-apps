//
//  Validate.swift
//  Reverse Polish notation
//
//  Created by JJ Andrew on 08/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class Validate {
    let expressionStack: [String]
    var reason = ""
    
    init(expressionStack: [String]) {
        self.expressionStack = expressionStack
    }
    
    func validate() {
        self.reason = "Test"
    }
}

