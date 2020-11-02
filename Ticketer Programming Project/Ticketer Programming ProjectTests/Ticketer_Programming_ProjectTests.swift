//
//  Ticketer_Programming_ProjectTests.swift
//  Ticketer Programming ProjectTests
//
//  Created by JJ Andrew on 15/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import XCTest
@testable import Ticketer_Programming_Project

class Ticketer_Programming_ProjectTests: XCTestCase {

    func testUrlCreatorReturnsCorrectStringWhenSearchTermIsProvided() {
        let handlingOfSkiddle = HandlingOfSkiddle()
        let search = "vivaldi"
        let result = handlingOfSkiddle.createUrl(term: search)
        let expected = "https://www.skiddle.com/api/v1/events/search/?api_key=52f07458a25911d3e1b89ab9f7f0c448&keyword=vivaldi&order=date&description=1"
        XCTAssertEqual(result, expected)
    }
    
    func testUrlCreatorReturnsNothingWhenNoSearchTermIsProvided() {
        let handlingOfSkiddle = HandlingOfSkiddle()
        let search: String?
        search = nil
        let result = handlingOfSkiddle.createUrl(term: search)
        let expected: String?
        expected = nil
        XCTAssertEqual(result, expected)
    }
/*
     
     
    func testEventChange() {
        let skiddleEvent = SkiddleEventResponse(error: 0, totalcount: "2", pagecount: 2, results: [SkiddleEvent(id: "", EventCode: "", eventname: "Event 1", cancelled: "0", cancellationDate: "", cancellationType: "", cancellationReason: "", rescheduledDate: "", imageurl: "url", largeimageurl: "Url", link: "Event1url", date: "25.11.2020", startdate: "", enddate: "", description: "Event 1 description", minage: "", imgoing: nil, goingtos: 0, goingtocount: "", tickets: true, entryprice: "", eventvisibility: "", artists: [], genres: []), SkiddleEvent(id: "", EventCode: "", eventname: "Event 2", cancelled: "0", cancellationDate: "", cancellationType: "", cancellationReason: "", rescheduledDate: "", imageurl: "url", largeimageurl: "Url", link: "Event2url", date: "26.12.2021", startdate: "", enddate: "", description: "Event 2 description", minage: "", imgoing: nil, goingtos: 0, goingtocount: "", tickets: true, entryprice: "", eventvisibility: "", artists: [], genres: [])])
        let events = skiddleEvent.convertToEventClass()
        XCTAssertEqual(skiddleEvent.results.count, events.count)
        for i in (0...skiddleEvent.results.count-1) {
            XCTAssertEqual(skiddleEvent.results[i].eventname, events[i].eventName)
            XCTAssertEqual(skiddleEvent.results[i].date, events[i].date)
            XCTAssertEqual(skiddleEvent.results[i].description, events[i].description)
            XCTAssertEqual(skiddleEvent.results[i].link, events[i].website[0])
        }
    }
    */
    func testValidateNameWorksForValidValue() {
        let NameEntryViewController = nameEntryViewController()
        let name = "Joe Bloggs"
        let expected = true
        let actual = NameEntryViewController.validateTextEntry(entry: name)
        XCTAssertEqual(expected, actual)
    }
    
    func testValidateNameWorksForEmptyValue() {
        let NameEntryViewController = nameEntryViewController()
        let name: String? =
        nil
        let expected = false
        let actual = NameEntryViewController.validateTextEntry(entry: name)
        XCTAssertEqual(expected, actual)
    }
    
    func testValidateNameWorksForShortValue() {
        let NameEntryViewController = nameEntryViewController()
        let name = "ab"
        let expected = false
        let actual = NameEntryViewController.validateTextEntry(entry: name)
        XCTAssertEqual(expected, actual)
    }
    
    func testValidateNameReturnsFalseForOneName() {
        let NameEntryViewController = nameEntryViewController()
        let name = "abcdefg"
        let expected = false
        let actual = NameEntryViewController.validateTextEntry(entry: name)
        XCTAssertEqual(expected, actual)
    }
    
    func testValidateNameReturnsFalseForFirstNameBeingOneCharacter() {
        let NameEntryViewController = nameEntryViewController()
        let name = "j smith"
        let expected = false
        let actual = NameEntryViewController.validateTextEntry(entry: name)
        XCTAssertEqual(expected, actual)
    }
    
    func testQuickSort() {
        let sortAndSearch = SortAndSearch()
        let test1Data = [Event(eventName: "event1", location: nil, date: "", description: "", saved: nil, website: [])]
        let test1Actual = sortAndSearch.quickSortByName(array: test1Data)
        let test1Expected = [Event(eventName: "event1", location: nil, date: "", description: "", saved: nil, website: [])]
        for event in test1Actual {
            print(event.eventName)
        }
        print("expected1")
        for event in test1Expected {
            print(event.eventName)
        }
        print("")
        
        let test2Data = [Event(eventName: "bba", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "bbb", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "abc", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "abd", location: nil, date: "", description: "", saved: nil, website: [])]
        let test2Actual = sortAndSearch.quickSortByName(array: test2Data)
        let test2Expected = [Event(eventName: "abc", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "abd", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "bba", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "bbb", location: nil, date: "", description: "", saved: nil, website: [])]
        for event in test2Actual {
            print(event.eventName)
        }
        print("expected2")
        for event in test2Expected {
            print(event.eventName)
        }
        print("")
        
        let test3Data = [Event(eventName: "bbc", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "bba", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "aad", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "aaa", location: nil, date: "", description: "", saved: nil, website: [])]
        let test3Actual = sortAndSearch.quickSortByName(array: test3Data)
        let test3Expected = [Event(eventName: "aaa", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "aad", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "bba", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "bbc", location: nil, date: "", description: "", saved: nil, website: [])]
        for event in test3Actual {
            print(event.eventName)
        }
        print("expected3")
        for event in test3Expected {
            print(event.eventName)
        }
        print("")
        
        let test4Data = [Event(eventName: "bbf", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "abc", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "dfa", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "bbf", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "abd", location: nil, date: "", description: "", saved: nil, website: [])]
        let test4Actual = sortAndSearch.quickSortByName(array: test4Data)
        let test4Expected = [Event(eventName: "abc", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "abd", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "bbf", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "bbf", location: nil, date: "", description: "", saved: nil, website: []), Event(eventName: "dfa", location: nil, date: "", description: "", saved: nil, website: [])]
        for event in test4Actual {
            print(event.eventName)
        }
        print("expected4")
        for event in test4Expected {
            print(event.eventName)
        }
    }
    
}
