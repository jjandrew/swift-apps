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
    
    func mergeSortByName(array: [Event]) -> [Event] {
        if array.count > 1 {
            let mid = array.count / 2
            var left: [Event] = []
            var right: [Event] = []
            for i in 0..<mid {
                left.append(array[i])
            }
            for i in mid..<array.count {
                right.append(array[i])
            }
            let leftArray = mergeSortByName(array: left)
            let rightArray = mergeSortByName(array: right)
            return mergeByName(left: leftArray, right: rightArray)
        } else {
            return array
        }
    }

    func mergeByName(left: [Event], right: [Event]) -> [Event] {
        var leftArray = left
        var rightArray = right
        var mergedArray: [Event] = []
        while leftArray.count > 0 && rightArray.count > 0 {
            if leftArray[0].eventName < rightArray[0].eventName {
                mergedArray.append(leftArray[0])
                leftArray.removeFirst()
            } else {
                mergedArray.append(rightArray[0])
                rightArray.removeFirst()
            }
        }
        
        while leftArray.count > 0 {
            mergedArray.append(leftArray[0])
            leftArray.removeFirst()
        }
        
        while rightArray.count > 0 {
            mergedArray.append(rightArray[0])
            rightArray.removeFirst()
        }
        return mergedArray
    }

    func quickSortByDate(array: [Event]) -> [Event] {
      var left = [Event]()
      var right = [Event]()
      var newData = [Event]()
        print(array.count)
      if array.count < 2 {
        return array
      } else {
        let pivot = array[0]
        let pivotDateArray = pivot.date.split(separator: "/")
        print(pivotDateArray)
        let pivotDateInt = Int(pivotDateArray[2]+pivotDateArray[1]+pivotDateArray[0])!
        print("pivot \(pivotDateInt)")
        for i in 1..<array.count {
            let item = array[i]
            let itemDateArray = item.date.split(separator: "/")
            print(itemDateArray)
            let itemDateInt = Int(itemDateArray[2]+itemDateArray[1]+itemDateArray[0])!
            print("item \(itemDateInt)")
            if itemDateInt < pivotDateInt {
                left.append(item)
                print("left")
             } else {
               right.append(item)
                print("right")
             }
       }
      newData.append(contentsOf: (quickSortByName(array: left)))
      newData.append(pivot)
      newData.append(contentsOf: (quickSortByName(array: right)))
      return newData
      }
    }
    
    func mergeSortByDate(array: [Event]) -> [Event] {
        if array.count > 1 {
            let mid = array.count / 2
            var left: [Event] = []
            var right: [Event] = []
            for i in 0..<mid {
                left.append(array[i])
            }
            for i in mid..<array.count {
                right.append(array[i])
            }
            let leftArray = mergeSortByName(array: left)
            let rightArray = mergeSortByName(array: right)
            return mergeByDate(left: leftArray, right: rightArray)
        } else {
            return array
        }
    }

    func mergeByDate(left: [Event], right: [Event]) -> [Event] {
        var leftArray = left
        var rightArray = right
        var mergedArray: [Event] = []
        while leftArray.count > 0 && rightArray.count > 0 {
            if leftArray[0].eventName < rightArray[0].eventName {
                mergedArray.append(leftArray[0])
                leftArray.removeFirst()
            } else {
                mergedArray.append(rightArray[0])
                rightArray.removeFirst()
            }
        }
        
        while leftArray.count > 0 {
            mergedArray.append(leftArray[0])
            leftArray.removeFirst()
        }
        
        while rightArray.count > 0 {
            mergedArray.append(rightArray[0])
            rightArray.removeFirst()
        }
        return mergedArray
    }

}
