//
//  SortAndSearch.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 02/11/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class SortAndSearch {
    
    let events: [Event] = []
    /*
     
    func mergeSortByName(events: [Event]) {
        if events.count > 1 {
            var mid = events.count/2
            var leftHalf = events[0..<mid]
            var rightHalf = events[mid...events.count-1]
            sortByName(events: leftHalf)
            sortByName(events: rightHalf)
        }
    }
         */
    
    func quickSortByName(array: [Event]) -> [Event] {
      var left = [Event]()
      var right = [Event]()
      var newData = [Event]()
      if array.count < 2 {
        return array
      } else {
        let pivot = array[0]
        for i in 1..<array.count {
            let item = array[i]
            if item.eventName < pivot.eventName {
                left.append(item)
             } else {
               right.append(item)
             }
       }
      newData.append(contentsOf: (quickSortByName(array: left)))
      newData.append(pivot)
      newData.append(contentsOf: (quickSortByName(array: right)))
      return newData
      }
    }
}
