//
//  UserTypeTests.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-10.
//  Copyright © 2016 DuoTab. All rights reserved.
//

import XCTest
@testable import DuoTab

class UserTypeTests: XCTestCase {
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testEqualityForMe() {
    XCTAssertTrue(UserType.Me == UserType.Me)
  }
  
  func testEqualityForSO() {
    XCTAssertTrue(UserType.SO == UserType.SO)
  }
  
  func testInEquality() {
    XCTAssertFalse(UserType.Me == UserType.SO)
  }
}
