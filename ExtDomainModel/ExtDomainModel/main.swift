//
//  main.swift
//  ExtDomainModel
//
//  Created by Hamzah Aly on 10/17/16.
//
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
    return "I have been tested"
}

open class TestMe {
    open func Please() -> String {
        return "I have been tested"
    }
}

protocol Mathematics {
    func add(_ to: Money) -> Money
    func subtract(_ from: Money) -> Money
}

extension Double {
    var USD: Money { return Money(amount: self, currency: "USD")}
    var EUR: Money { return Money(amount: self, currency: "EUR")}
    var GBP: Money { return Money(amount: self, currency: "GBP")}
    var YEN: Money { return Money(amount: self, currency: "YEN")}
}

////////////////////////////////////
// Money
//
public struct Money: CustomStringConvertible, Mathematics {
    public var amount : Double
    public var currency : String
    public var description: String { return "\(currency)" + "\(amount)"}
    
    // Convert the money to USD
    public func toUSD(amount: Double, currency: String) -> Double {
        var amt: Double
        switch currency {
        case "GBP":
            amt = amount * 2
        case "EUR":
            amt = amount * (2 / 3)
        case "CAN":
            amt = amount * (4 / 5)
        case "USD":
            amt = amount * 1
        default:
            amt = 0
            print("Can only use these 4 types of currencies")
        }
        return amt
    }
    
    // Convert to a currency of GBP, EUR, CAN, or USD
    public func convert(_ to: String) -> Money {
        var toConvert: Double
        var newAmt: Double
        var newCurrency: String
        switch to {
        case "GBP":
            toConvert = toUSD(amount: self.amount, currency: self.currency)
            newAmt = toConvert * (1 / 2)
            newCurrency = "GBP"
        case "EUR":
            toConvert = toUSD(amount: self.amount, currency: self.currency)
            newAmt = toConvert * (3 / 2)
            newCurrency = "EUR"
        case "CAN":
            toConvert = toUSD(amount: self.amount, currency: self.currency)
            newAmt = toConvert * (5 / 4)
            newCurrency = "CAN"
        case "USD":
            toConvert = toUSD(amount: self.amount, currency: self.currency)
            newAmt = toConvert * 1
            newCurrency = "USD"
        default:
            newAmt = 0
            newCurrency = "USD"
            print("Can only use these 4 currencies")
        }
        return Money(amount: newAmt, currency: newCurrency)
    }
    
    //Adds two money structs
    public func add(_ to: Money) -> Money {
        var amt: Double
        var toAmt: Double
        var sum: Double
        
        switch to.currency {
        case "GBP":
            amt = toUSD(amount: self.amount, currency: self.currency)
            toAmt = toUSD(amount: to.amount, currency: to.currency)
            sum = amt + toAmt
            sum = sum * (1 / 2)
        case "EUR":
            amt = toUSD(amount: self.amount, currency: self.currency)
            toAmt = toUSD(amount: to.amount, currency: to.currency)
            sum = amt + toAmt
            sum = sum * (3 / 2)
        case "CAN":
            amt = toUSD(amount: self.amount, currency: self.currency)
            toAmt = toUSD(amount: to.amount, currency: to.currency)
            sum = amt + toAmt
            sum = sum * (5 / 4)
        case "USD":
            amt = toUSD(amount: self.amount, currency: self.currency)
            toAmt = toUSD(amount: to.amount, currency: to.currency)
            sum = amt + toAmt
            sum = sum * 1
        default:
            sum = 0
            print("Can only use these 4 currencies")
        }
        
        return Money(amount: sum, currency: to.currency)
    }
    
    //Subtracts two money structs
    public func subtract(_ from: Money) -> Money {
        var amt: Double
        var toAmt: Double
        let difference: Double
        
        switch from.currency {
        case "GBP":
            amt = toUSD(amount: self.amount, currency: self.currency)
            toAmt = toUSD(amount: from.amount, currency: from.currency)
            difference = amt - toAmt
            
        case "EUR":
            amt = toUSD(amount: self.amount, currency: self.currency)
            toAmt = toUSD(amount: from.amount, currency: from.currency)
            difference = amt - toAmt
        case "CAN":
            amt = toUSD(amount: self.amount, currency: self.currency)
            toAmt = toUSD(amount: from.amount, currency: from.currency)
            difference = amt - toAmt
        case "USD":
            amt = toUSD(amount: self.amount, currency: self.currency)
            toAmt = toUSD(amount: from.amount, currency: from.currency)
            difference = amt - toAmt
        default:
            difference = 0
            print("Can only use these 4 currencies")
        }
        
        return Money(amount: difference, currency: from.currency)
    }
}

////////////////////////////////////
// Job
//
open class Job: CustomStringConvertible {
    fileprivate var title : String
    fileprivate var type : JobType
    public var description: String { return "title: \(title) " + "JobType: \(type)"}
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
    
    //Required initializer that provides a job title and type
    public init(title : String, type : JobType) {
        self.title = title
        self.type = type
    }
    
    //Calculates income based on the number of hours passed
    open func calculateIncome(_ hours: Int) -> Int {
        var income: Double
        let hours: Double = Double(hours)
        switch type {
        case .Salary(let amount):
            income = Double(amount)
        case .Hourly(let amount):
            income = amount * hours
        }
        return Int(income)
    }
    
    //Raises a person's Salary/Hourly by a percentage. The passed number beahaves differently depending on the JobType
    open func raise(_ amt : Double) {
        switch type {
        case .Salary(let amount):
            type = JobType.Salary(amount + Int(amt))
        case .Hourly(let amount):
            type = JobType.Hourly(amount + amt)
        }
    }
}

////////////////////////////////////
// Person
//
open class Person: CustomStringConvertible {
    open var firstName : String = ""
    open var lastName : String = ""
    open var age : Int = 0
    public var description: String { return "FirstName: \(firstName) LastName: \(lastName) Age: \(age)"}
    
    fileprivate var _job : Job? = nil
    open var job : Job? {
        get {
            if _job == nil || age < 16 {
                return nil
            } else {
                return _job!
            }
        }
        set(value) {
            _job = value
        }
    }
    
    fileprivate var _spouse : Person? = nil
    open var spouse : Person? {
        get {
            if _job == nil || age < 18 {
                return nil
            } else {
                return _spouse!
            }
        }
        set(value) {
            _spouse = value
        }
    }
    
    //Initializes a Person with a required fname, lname, and age
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    //Returns a string representation of a Person
    open func toString() -> String {
        let age = " age:" + "\(self.age) "
        let job = "job:" + "\(_job?.title) "
        let spouse = "spouse:" + "\(_spouse)"
        
        return "[Person: firstName:" + self.firstName + " lastName:" + self.lastName + age + job + spouse + "]"
    }
}

////////////////////////////////////
// Family
//
open class Family: CustomStringConvertible {
    fileprivate var members : [Person] = []
    public var description: String { return getFamily()}
    
    func getFamily() -> String {
        var name: String
        var family: String = ""
        for member in members {
            name = member.firstName + member.lastName
            family += "\(name) "
        }
        return family
    }
    
    //Initializes a family requiring 2 spouses
    public init(spouse1: Person, spouse2: Person) {
        spouse1.spouse = spouse2
        spouse2.spouse = spouse1
        members.append(spouse1)
        members.append(spouse2)
    }
    
    //Adds a member to the family with an age initialized to 0
    open func haveChild(_ child: Person) -> Bool {
        for member in members {
            if member.age > 21 {
                members.append(child)
                return true
            }
        }
        return false
    }
    
    //Calculates the household income of the family by adding the income of all members
    open func householdIncome() -> Int {
        var hIncome: Int = 0
        for member in members {
            if member.job?.type == nil {
                print("no job, so no income")
            } else {
                let income = member.job?.calculateIncome(2000)
                hIncome += income!
            }
        }
        return hIncome
    }
}
