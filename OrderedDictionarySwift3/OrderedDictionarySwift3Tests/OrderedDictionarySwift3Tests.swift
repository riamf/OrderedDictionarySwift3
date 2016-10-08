//
//  OrderedDictionarySwift3Tests.swift
//  OrderedDictionarySwift3Tests
//
//  Created by Pawel Kowalczuk on 08/10/16.
//  Copyright © 2016 Pawel Kowalczuk. All rights reserved.
//

import XCTest
@testable import OrderedDictionarySwift3

class OrderedDictionarySwift3Tests: XCTestCase {

    private var dc = OrderedDictionary<String,String>()
    private let key = "key"
    private let val = "value"

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    private func resetDataSource() {
        dc = OrderedDictionary<String,String>()
    }

    private func insert(count: Int) {
        for i in 0...count-1 {
            dc[key + "\(i)"] = val
        }
    }
    
    func testCapacity() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        resetDataSource()
        insert(count: 3)
        XCTAssertTrue(dc.count == 3, "Ordered dictionary should count 3.")
    }

    func testAddingValue() {
        resetDataSource()
        insert(count: 1)
        XCTAssertTrue(dc.count == 1, "Should have one new value.")
    }

    func testRemovingValue() {
        resetDataSource()
        insert(count: 1)

        _ = dc.removeValue(forKey: key + "0")
        XCTAssertTrue(dc.isEmpty(), "Dictionary should be empty")
    }
}
