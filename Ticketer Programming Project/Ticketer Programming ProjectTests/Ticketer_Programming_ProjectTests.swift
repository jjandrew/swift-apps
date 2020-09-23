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

    func testUrlCreatorWorks() {
        let handlingOfSkiddle = HandlingOfSkiddle()
        let search = "vivaldi"
        let result = handlingOfSkiddle.creatUrl(searchTerm: search)
        let expected = "https://www.skiddle.com/api/v1/events/search/?api_key=52f07458a25911d3e1b89ab9f7f0c448&keyword=vivaldi&order=date&description=1"
    }

}
