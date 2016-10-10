//
//  Balance.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-10.
//  Copyright © 2016 DuoTab. All rights reserved.
//

import Foundation

/// Maintains the running tab between the couple.
struct BalanceModel {
  var amount: Double
  
  /// If the balance is positive, then "Me" owes "SO", if the balance is negative, then "SO" owes "Me"
  var userOwing: UserType? {
    if amount > 0 {
      return UserType.SO
    } else if amount < 0 {
      return UserType.Me
    } else /* amount == 0 */ {
      return nil // A zero balance means neither user is owing
    }
  }
  
  /// Returns the amount as a currency value in absolute terms
  var currencyValue: String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    
    return formatter.string(from: NSNumber(value: abs(amount)))
  }
}
