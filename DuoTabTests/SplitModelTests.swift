//
//  SplitModelTests.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-10.
//  Copyright © 2016 DuoTab. All rights reserved.
//

import XCTest
@testable import DuoTab

class SplitModelTests: XCTestCase {
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testSplitInitReturnsNilForNegativeValue() {
    let split = SplitModel(withAmount: -9)
    XCTAssertNil(split)
  }
  
  func testSplitInitReturnsNilForValueGreaterThanOne() {
    let split = SplitModel(withAmount: 9)
    XCTAssertNil(split)
  }
  
  func testSplitReturnsCorrectValueWhenInCorrectRange() {
    if let split = SplitModel(withAmount: 0.6) {
      XCTAssertEqual(split.split, 0.6)
    } else {
      XCTFail("The value should not have been nil")
    }
  }
}
