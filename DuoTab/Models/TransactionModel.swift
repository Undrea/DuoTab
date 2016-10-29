//
//  TransactionModel.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-10.
//  Copyright © 2016 DuoTab. All rights reserved.
//

import Foundation

/// Contains all the information regarding a single transaction.
struct TransactionModel {
  var amount: Double
  var date: NSDate
  
  /// Which user made the transaction
  var user: UserType
  
  /// Keep track of how the amount should be divided; nil means there is no split. (e.g. "Me" pays for something, "SO" owes 100% of that back to "Me")
  var split: SplitModel?
  
  var type: ExpenseType?
  var notes: String?
  var photo: NSObject?
}
