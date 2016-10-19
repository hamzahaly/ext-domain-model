//
//  FamilyTests.swift
//  ExtDomainModel
//
//  Created by iGuest on 10/18/16.
//
//

import XCTest

class FamilyTests: XCTestCase {

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
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFamily() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        ted.job = Job(title: "Gues Lecturer", type: Job.JobType.Salary(1000))
            
        let charlotte = Person(firstName: "Charlotte", lastName: "Neward", age: 45)
            
        let family = Family(spouse1: ted, spouse2: charlotte)
            
        let familyIncome = family.householdIncome()
        XCTAssert(familyIncome == 1000)
    }
        
    func testFamilyWithKids() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        ted.job = Job(title: "Gues Lecturer", type: Job.JobType.Salary(1000))
            
        let charlotte = Person(firstName: "Charlotte", lastName: "Neward", age: 45)
            
        let family = Family(spouse1: ted, spouse2: charlotte)
            
        let mike = Person(firstName: "Mike", lastName: "Neward", age: 22)
        mike.job = Job(title: "Burger-Flipper", type: Job.JobType.Hourly(5.5))
            
        let matt = Person(firstName: "Matt", lastName: "Neward", age: 16)
        let _ = family.haveChild(mike)
        let _ = family.haveChild(matt)
            
        let familyIncome = family.householdIncome()
        XCTAssert(familyIncome == 12000)
    }
    
    func testFamilyDescription() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        let charlotte = Person(firstName: "Charlotte", lastName: "Neward", age: 45)
        let family = Family(spouse1: ted, spouse2: charlotte)
        print(family.description)
        let d = family.description
        XCTAssert(d == "TedNeward CharlotteNeward ", d)
        
    }
}
