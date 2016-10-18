//
//  ExtDomainModelTests.swift
//  ExtDomainModelTests
//
//  Created by iGuest on 10/18/16.
//
//

import XCTest

import ExtDomainModel

class ExtDomainModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let money = Money(amount: 10, currency: "GBP")
        XCTAssert(money.description == "GBP10.0")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
