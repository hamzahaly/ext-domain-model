//
//  MoneyTests.swift
//  ExtDomainModel
//
//  Created by iGuest on 10/18/16.
//
//

import XCTest

class MoneyTests: XCTestCase {

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
    
    let tenUSD = Money(amount: 10, currency: "USD")
    let twelveUSD = Money(amount: 12, currency: "USD")
    let fiveGBP = Money(amount: 5, currency: "GBP")
    let fifteenEUR = Money(amount: 15, currency: "EUR")
    let fifteenCAN = Money(amount: 15, currency: "CAN")
    
    func testCanICreateMoney() {
        let oneUSD = Money(amount: 1, currency: "USD")
        XCTAssert(oneUSD.amount == 1)
        XCTAssert(oneUSD.currency == "USD")
        
        let tenGBP = Money(amount: 10, currency: "GBP")
        XCTAssert(tenGBP.amount == 10)
        XCTAssert(tenGBP.currency == "GBP")
    }
    
    func testUSDtoGBP() {
        let gbp = tenUSD.convert("GBP")
        XCTAssert(gbp.currency == "GBP")
        XCTAssert(gbp.amount == 5)
    }
    func testUSDtoEUR() {
        let eur = tenUSD.convert("EUR")
        XCTAssert(eur.currency == "EUR")
        XCTAssert(eur.amount == 15)
    }
    func testUSDtoCAN() {
        let can = twelveUSD.convert("CAN")
        XCTAssert(can.currency == "CAN")
        XCTAssert(can.amount == 15)
    }
    func testGBPtoUSD() {
        let usd = fiveGBP.convert("USD")
        XCTAssert(usd.currency == "USD")
        XCTAssert(usd.amount == 10)
    }
    func testEURtoUSD() {
        let usd = fifteenEUR.convert("USD")
        XCTAssert(usd.currency == "USD")
        XCTAssert(usd.amount == 10)
    }
    func testCANtoUSD() {
        let usd = fifteenCAN.convert("USD")
        XCTAssert(usd.currency == "USD")
        XCTAssert(usd.amount == 12)
    }
    
    func testUSDtoEURtoUSD() {
        let eur = tenUSD.convert("EUR")
        let usd = eur.convert("USD")
        XCTAssert(tenUSD.amount == usd.amount)
        XCTAssert(tenUSD.currency == usd.currency)
    }
    func testUSDtoGBPtoUSD() {
        let gbp = tenUSD.convert("GBP")
        let usd = gbp.convert("USD")
        XCTAssert(tenUSD.amount == usd.amount)
        XCTAssert(tenUSD.currency == usd.currency)
    }
    func testUSDtoCANtoUSD() {
        let can = twelveUSD.convert("CAN")
        let usd = can.convert("USD")
        XCTAssert(twelveUSD.amount == usd.amount)
        XCTAssert(twelveUSD.currency == usd.currency)
    }
    
    func testAddUSDtoUSD() {
        let total = tenUSD.add(tenUSD)
        XCTAssert(total.amount == 20)
        XCTAssert(total.currency == "USD")
    }
    
    func testAddUSDtoGBP() {
        let total = tenUSD.add(fiveGBP)
        XCTAssert(total.amount == 10)
        XCTAssert(total.currency == "GBP")
    }
    
    func testGBPDescription() {
        let money = Money(amount: 10, currency: "GBP")
        XCTAssert(money.description == "GBP10.0")
    }
    
    func testYenExtension() {
        let yen = 9054.YEN
        XCTAssert(yen.description == "YEN9054.0")
    }
    

}
