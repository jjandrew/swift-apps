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
    
    func testConvertingSkiddleEventDoesSoCorrectly() {
        let handlingOfSkiddle = HandlingOfSkiddle()
        let url = "https://www.skiddle.com/api/v1/events/search/?api_key=52f07458a25911d3e1b89ab9f7f0c448&keyword=vivaldi&order=date&description=1"
        handlingOfSkiddle.createJsonString(urlEntry: url)
        let skiddleEvent = handlingOfSkiddle.skiddleEvents
        if let events = skiddleEvent?.convertToEventClass() { 
            XCTAssertEqual(skiddleEvent?.results.count, events.count)
            for i in (0...(skiddleEvent?.results.count)!) {
                print(i)
                XCTAssertEqual(skiddleEvent?.results[i].eventname, events[i].eventName)
                XCTAssertEqual(skiddleEvent?.results[i].date, events[i].date)
                XCTAssertEqual(skiddleEvent?.results[i].description, events[i].description)
                XCTAssertEqual(skiddleEvent?.results[i].link, events[i].website[0])
            }
        } else {
            XCTFail()
        }
    }
    
}
