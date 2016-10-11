//
//  BalanceModelTests.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-10.
//  Copyright © 2016 DuoTab. All rights reserved.
//

import XCTest
@testable import DuoTab

class BalanceModelTests: XCTestCase {
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testUserOwingReturnsMe() {
    let balance = BalanceModel(amount: -100.00)
    XCTAssertEqual(balance.userOwing, .Me)
  }
  
  func testUserOwingReturnsSO() {
    let balance = BalanceModel(amount: 100.00)
    XCTAssertEqual(balance.userOwing, .SO)
  }
  
  func testUserOwingReturnsNil() {
    let balance = BalanceModel(amount: 0.00)
    XCTAssertNil(balance.userOwing)
  }
  
  func testCurrencyValueForZero() {
    let balance = BalanceModel(amount: 0)
    XCTAssertEqual(balance.currencyValue, "$0.00")
  }
  
  func testCurrencyValueForPositiveNumber() {
    let balance = BalanceModel(amount: 10)
    XCTAssertEqual(balance.currencyValue, "$10.00")
  }
  
  func testCurrencyValueForNegativeNumberStillReturnsPositive() {
    let balance = BalanceModel(amount: -10)
    XCTAssertEqual(balance.currencyValue, "$10.00")
  }
  
  func testCurrencyValueForHugeNumber() {
    let balance = BalanceModel(amount: 1000000.99)
    XCTAssertEqual(balance.currencyValue, "$1,000,000.99")
  }
  
  func testCurrencyValueRoundingCents() {
    let balance = BalanceModel(amount: 9.989)
    XCTAssertEqual(balance.currencyValue, "$9.99")
  }
  
  func testCurrencyValueRoundingDollars() {
    let balance = BalanceModel(amount: 9.999)
    XCTAssertEqual(balance.currencyValue, "$10.00")
  }
  
  /// Store Extension Tests
  func testSavingBalanceToNSUserDefaults() {
    let balance = BalanceModel(amount: 10.0)
    balance.save(forKey: "TestBalanceKey")
  }
  
  func testLoadingSavedBalance() {
    // Ensure key is in NSUserDefaults with value of 10.0
    UserDefaults.standard.set(10.0, forKey: "TestBalanceKey")
    
    // Check if we can load that value
    if let balance = BalanceModel.loadBalance(forKey: "TestBalanceKey") {
      XCTAssertEqual(balance.amount, 10.0)
    } else {
      XCTFail()
    }
  }
  
  func testLoadReturnsNilWhenNoKeyPresent() {
    // Ensure key is in NSUserDefaults with value of 10.0
    UserDefaults.standard.removeObject(forKey: "TestBalanceKey")

    // Check if we can load that value
    XCTAssertNil(BalanceModel.loadBalance(forKey: "TestBalanceKey"))
  }
}
