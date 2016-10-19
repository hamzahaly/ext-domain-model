//
//  JobTests.swift
//  ExtDomainModel
//
//  Created by iGuest on 10/18/16.
//
//

import XCTest

class JobTests: XCTestCase {

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
    
    func testCreateSalaryJob() {
        let job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        XCTAssert(job.calculateIncome(50) == 1000)
    }
    
    func testCreateHourlyJob() {
        let job = Job(title: "Janitor", type: Job.JobType.Hourly(15.0))
        XCTAssert(job.calculateIncome(10) == 150)
    }
    
    func testSalariedRaise() {
        let job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        XCTAssert(job.calculateIncome(50) == 1000)
        
        job.raise(1000)
        XCTAssert(job.calculateIncome(50) == 2000)
    }
    
    func testHourlyRaise() {
        let job = Job(title: "Janitor", type: Job.JobType.Hourly(15.0))
        XCTAssert(job.calculateIncome(10) == 150)
        
        job.raise(1.0)
        XCTAssert(job.calculateIncome(10) == 160)
    }
    
    func testJobDescription() {
        let job = Job(title: "Professional Streamer", type: Job.JobType.Salary(5000))
        XCTAssert(job.description == "Title: Professional Streamer JobType: Salary(5000)")
    }

}
