//
//  JsonMappingTest.swift
//  DriverSearchTests
//
//  Created by Martin on 11/18/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import XCTest
@testable import DriverSearch

class JsonMappingTest: XCTestCase {
    var taxis: [Taxi] = []
    
    override func setUp() {
        taxis = JsonLoader.load("taxiData.json")
    }

    override func tearDown() {
        taxis = []
    }

    func testHasObjects() {
        XCTAssert(taxis.count > 0)
    }
    
    func testNilProperties() {
        var error = false
        for taxi in taxis {
            if !valid(taxi: taxi) {
                error = true
                break
            }
        }
        XCTAssert(error == false)
    }
    
    private func valid(taxi: Taxi) -> Bool {
        if taxi.id.count == 0 {
            return false
        }
        if taxi.id == "0" {
            return false
        }
        if taxi.heading == "" {
            return false
        }
        if taxi.coordinate == Coordinates.zero {
            return false
        }
        return true
    }
}
