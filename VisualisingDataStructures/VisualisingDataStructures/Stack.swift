//
//  stack.swift
//  VisualisingDataStructures
//
//  Created by Andrew, James (NA) on 28/01/2020.
//  Copyright © 2020 Andrew, James (NA). All rights reserved.
//

import Foundation

struct Stack {
  let maxSize: Int
  var top: Int
  var array: [String]

  mutating func push(item: String) {
    if top >= maxSize - 1 {
      print("Stack is full")
    } else {
      top += 1
      array[top] = item
    }
  }

  mutating func pop() -> String {
    if top < 0 {
      print("Stack is empty")
      let value = "Stack is empty"
      return value
    } else {
      let value = array[top]
      array[top] = "_"
      top -= 1
      return value
    }
  }

  mutating func peek() -> String {
    if top > -1 {
      return array[top]
    } else {
      return "Empty stack"
    }
  }
}
