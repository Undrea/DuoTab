//
//  SplitModel.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-10.
//  Copyright © 2016 DuoTab. All rights reserved.
//

/// Defines the split percentage of an amount between two parties (invariant).
struct SplitModel {
  let split: Float
  
  /// Ensures the division amount is a number in the range [0, 1], returns nil otherwise.
  init?(withAmount: Float) {
    guard 0...1 ~= withAmount else {
      return nil
    }
    split = withAmount
  }
}
